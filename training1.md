# Trivadis Performance Days 2021 - Notes
Ok, mostly people from Switzerland (the Swiss German part).

## Basics
https://blogs.oracle.com/optimizer/post/how-do-i-display-and-read-the-execution-plans-for-a-sql-statement

```sql
select plan_table_output
from table(dbms_xplan.display_cursor(null,null,'basic'));
```


## Jonathan Lewis - Transformations
https://jonathanlewis.wordpress.com

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

## David Kurtz - Practical Use of Active Session History

What counts after all is end-to-end performance, but ASH helps with the database
part.

### ASH fundamentals
Samples the active sessions.

### ASH SQL

```sql
SELECT ...
FROM v$active_session_history
```

### Architecture
Circular buffer of session state objects.

### License
Enterprise edition

There's also OraSASH

### Before: Trace
But trace has to be enabled.

ASH will tell you who is blocking you.

SELECT * FROM v$diag_trace_file
SELECT * FROM v$diag_trace_file_contents

### ASH Dimensions and Attributes
- Which transaction
- Which session
- Which container
- Which plan hash
- ...

### Enterprise Manager Performance Hub

### Active Session History Report
Top SQL queries etc., but normally you want to query yourself.

### EDB360/SQLD360
Open Source Tool

### Important: Instrumentation
DBMS_APPLICATION_INFO to set session attributes so that they get picked up
by trace and ASH.

Very rarely activated.

in your stored procedure, read the current module and action, then set_module yours , in the end, set it back.

#### How to instrument code you don't own
- Triggers

Otherwise: Everything is JDBC Thin Client

-> Useless

#### What are you looking for
History or current data? SQL_PLAN_HASH_VALUE, what event?

DBA_HIST_SNAPSHOT

### Demo
SELECT * from table(dbms_xplan.display_awr(sql_id, 'thehash',...)

-> He normally puts the whole select in a column

### Some challenges
- Literals instead of bind variables

Example in PeopleSoft - literal operator id, will get a different execution plan.

- Aggregate by SQL_PLAN_HASH_VALUE

But you may not be able to find the SQL since it's been aged out.

dba_hist_sqltext

### Caveats with RAC
Each RAC instance has its own ASH buffer and manages own sampling, as well as its own AWR snapshots.

### How he works
May be an interesting template for me as well, to look up in the presentation.


