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


## Neil Chandler - How Oracle Makes Decisions

### What is Cost

 * Selectivity - fraction of rows satisfying a condition
 * Cardinality - selectivity * number of input rows
 * Cost - the amount of resources needed

Check it out on dba_tab_statistics

On columns with DBA_TAB_COL_STATISTICS

If Oracle thinks it will only get one row back, it does interesting other
things (for example, cartesian join)

### Clustering factor - how aligned is the index to the table?

High clustering factor - index considered more expensive.

TABLE_CACHED_BLOCKS - it's not that bad if the previous block was still
cached!

### System Statistics
Describe IO and CPU performance of your hardware.

Oracle >= 12 - don't bother, use the defaults.

sys.aux_stats$

EXADATA recalculate - see you have many more blocks per read

### When this causes problems

### First example
Multi-block read time 14, single block read time, 71071 -> impossible, and Oracle recognizes it.

### Second example
Multi-block read 6, single-block read 3.85 -> full scan becomes very unattractive, so we're using indexes instead of just going for the full scan

### Third example
optimizer_index_cost_adj 50 (work on indexes), multi block cost per block .18 (I like table scans)

### Cardinality Calculations
Undocumented and a little complex

Histograms - almost free to gather

### When will the optimizer pick an index

First, let's see what a table scan would cost

then, indexes by selectivity

Combine indexes (through bitmap) - we assume that the selectivities multiply.

### 10053 trace

	alter session set events 'trace[rdbms.SQL_Optimizer.*][sql:sql-id-here]';

	DBMS_SQLDIAG.DUMP_TRACE(...)

-> use with caution

-> be aware of adaptive execution plans

Know what is being bypassed (for example, vector transformation)

See what to use for single table access

determine join order

## Roger MacNicol the lifecycle of a row
Performance things that you may not have considered.

By default, block dumps are not including encrypted data, but you can disable
that if you must.

Rowpiece - 255 columns max.

### PCTFREE and PCTUSED
PCTFREE is the difference between size of the initial insert and the maximum size in the row's lifecycle.

PCTUSED can we give it back.

Column order matters because how we walk through it -> dbms_redefinition. But this of course means that you always should explicitly name columns on insert.

The reason migrated rows get created is that changing row id has to update all
indexes.

((don't go to 12.1))

### Delete
Mark as deleted, then once the space is needed, sfll - empty slot in the block.

### Fragmentation and Compaction
table fetch continued row stat

but compare it relative to the rows gotten.

Analyze table -> populates columns in user_tables.

### Ways of dealing with it
#### 1x
datapump export import
alter table shrink space compact

#### 2x
dbms_redefinition
alter table move (compress)

#### more than 2x
Alter table move online

### Sample
Deleting every other row

alter table tpch.foo shrink space compact;

alter table tpch.foo shrink space;

### What happens if data cools down?

#### Compression
- Semantic (dictionary lookup for example) -> does not need to be decompressed to perform queries on
- Bitwise compression needs decompression

#### Late in the lifecycle
Column stores - we don't insert stuff anymore, and now we can really compress (since there's little entropy in a specific column).

## Q & A

 * Indexes on Exadata - mark them as invisible, run the workload and re-enable them afterwards to see. They talk about Peoplesoft migration to Exadata, tough
 to work out which indexes you can live without
 * Automatic indexes
 * Indexes again - since we can parallelize a lot in Exadata, mostly those are
 chosen instead of an index
 * Query transformations - how does having a cursor expression in there change the available transformations / optimizations?
 * What can lead to changing execution plan without changing the code
   - more data
   - time
   - updating statistics
   - if you go out of the range (current known high value) -> let's adapt
   - real time statistics
 * Autonomous features - should make things easier, feedback until now was that there was more surprise
 * https://jonathanlewis.wordpress.com/2013/12/23/plan-changes/
 * including columns in an index works a lot differently in Oracle - clustering factor changes, not like in SQL Server

