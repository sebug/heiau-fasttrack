# Trivadis Performance Days 2021 - Notes
Ok, mostly people from Switzerland (the Swiss German part).

## Basics
https://blogs.oracle.com/optimizer/post/how-do-i-display-and-read-the-execution-plans-for-a-sql-statement

```sql
select plan_table_output
from table(dbms_xplan.display_cursor(null,null,'basic'));
```


## Jonathan Lewis - Transformations
ANSI joins - gives query blocks per join.

```sql
select * from table(
dbms_xplan.display_cursor(
null,
null,
'qbregistry, qbregistry_graph'
)
```

Then use GraphViz to show.

### Small tip for WHERE ... IN
You don't need the DISTINCT, Oracle knows that it can do that.

Semi join - only have to join once.

### What affects transformation options?
 * Version, patches, parameters (hundreds!), fix_controls (thousands)
 * Uniqueness and NOT NULL are important
 * ...

#### Transitive closure
 * If A in (x, y, z) and B = A then B in (x, y, z)
 * Constraint check(object_type = upper(object_type)) -> it can use that check to search that upper(object_type) = 'FUNCTION' -> so it can actually use that to use the index! Wonderful!

#### Legend of possible transforms
join predicate push-down versus non-cost-based JPPD. So that abbreviation may
not mean the same thing depending on the version.

#### Looking at the oracle binary to see reasons why a transform is not applied :)

	string -a oracle | grep "^SU:"

#### Give your query blocks names

/*+ qb_name(main) */

#### Summing up cost
Self-induced caching -> if we do it a lot, then the cache will kick in.

#### Sample: Join elimination
Idea: You query a common view but only need columns from some tables, Oracle may eliminate some joins to tables not shown and having no impact on filtering.

With grandparent example - order made a difference (tough luck)

#### Sample: Join factorization
You use a table in both parts of a UNION all, we can take it outside.

#### What to do if it's almost there?
Take the whole outline and put it in the query.

#### OR Expansion
Oracle can get clever with ORs .

#### De Morgan transformation cleverness
Oracle just undid what he did manually.

But you can transform AND to INTERSECT

