# Heiau Fast-Track
This repository containing the learnings of Oracle DB that I picked up to
become as fluent in it as I am in SQL Server. The points I highlight are
mostly from that perspective, for a fresher look on all this, I suggest
you look elsewhere.

## Resources
I'm doing all the stuff using the [Database Application Development VM](https://www.oracle.com/database/technologies/databaseappdev-vm.html) that you can download from Oracle.

I'm following the LinkedIn Learning courses from Bob Bryla at the moment.

### Client Tools
You can double-click on a table in SQL Developer to get all the information and the table creation script.

View DBA and then Database Status -> Instance Viewer to see info on your database.

### Basics
Column names can be 128 characters long, alphanumeric and _, $, #

#### Data Type differences to SQL Server
VARCHAR2(length) for character data

#### Reflection
You can use all_tab_columns to query columns, a bit like INFORMATION_SCHEMA.COLUMNS.

#### Calculations
If you just have to call a scalar function, you can SELECT from dual

#### Columns
You can use column position for order by clause - ORDER BY 2 will order by the second column of the select statement.

#### CREATE TABLE AS
You can use create table as to create a table from a select statement.

#### Intervals
SELECT interval '8' day from DUAL;

#### Quote delimiter
Use q'{ to make a quoted string based on the brackets, so that you don't have to double up quotes inside.

#### Order by
NULL is last (except if you order by column_name nulls first)

#### Collation

	SELECT parameter, value
	FROM v$nls_parameters
	WHERE parameter = 'NLS_SORT'

### Single-row functions

#### Character
SOUNDEX('Louise') = SOUNDEX('Louise')

SUBSTR is 1-based.

INSTR(department_name, 'ing') is indexOf, but since it's 1-based, 0 means non-existence

#### Date vs TIMESTAMP
Date is 7 bytes, TIMESTAMP 7, 11 or 13

	SELECT extract(minute from systimestamp) FROM dual

	to_number(department_name default -1 on conversion error)

	to_timestamp('2021-10-23 13:37', 'YYYY-MM-DD HH24:MI')

#### General functions
dump to get the content of the column

#### Listing functions

	select * from v$sqlfn_metadata

You can make your own reports of course.

### Aggregate Functions
COUNT(expr | col) --> count non-null values for expr or column

NVL(NULL, 42) --> 42

	SELECT listagg(distinct first_name, ', ') FROM employees

### Joins
Oracle syntax with (+) denoting the table that's outer

#### NATURAL JOIN
Type less, join on all common columns.

### Oracle Data Dictionary
Metadata

Dynamic performance views start with GV$ in a RAC environment.

 * catalog.sql Creates the data dictionary and synonyms to access it, granting access to the synonyms to the PUBLIC user
 * catproc.sql Creates all built-in PL/SQL packages, functions and procedures
 * catpcat.sql runs both of the aforementioned in parallel
 * catclust.sql creates data dictionary views for RAC

We have to grant additional rights, probably

	grant select any dictionary to OE;

DBA_* views contain metadata on all objects

*_TAB_COLUMNS for list of columns within a table.

### Data manipulation
INSERT ALL and CREATE TABLE AS are a bit Oracle-specific.

INSERT WHEN condition THEN INTO Table1 ELSE Table2

INSERT ALL number of distinct columns < 1k

INSERT FIRST inserts in the first table matching the when clause

DELETE with CASCADE removes the table rows with on delete cascade

### Creating Objects
Naming rules: alphanumeric plus _, $ and #, up to 128 characters

#### When creating tables
Can have CHECK constraints

needs the CREATE TABLE system privilege

UNLIMITED TABLESPACE privilege or QUOTA

#### Indexes
Types: B-Tree, UNIQUE, BITMAP

Your index can be in another schema

### Dropping Objects
Recycle bin :-)

CASCADE CONSTRAINTS to remove foreign key constraints

use PURGE to avoid it going to the recycle bin if that is enabled.

flashback table rename to

DROP INDEX ONLINE to allow data modification while we're dropping.

both table and index show up in the recyclebin.

## Advanced SQL

### Hierarchical functions

	select rpad(' ', level, '') || last_name employee,
	case when connect_by_isleaf = 1 then 'No' else 'Yes' end is_manager
	from employees
	start with employee_id = 100
	connect by prior employee_id=manager_id

sys_connect_by_path to output the whole path

Of course CTEs are still possible.

### NULL handling
NVL2(expr1, expr2, expr3) to return expr2 if expr1 is not null, else expr3

NULLIF(expr1, expr2) returns null if expr1 and expr2 are equal.

COALESCE as in SQL Server

### Analytic functions

aggregate OVER (PARTITION BY ) , for example for a running total

rank() skips numbers on ties, dense_rank() keeps them.

WITHIN GROUP to order inside the group

### Set Operators
You can put in parenthesis with MINUS or INTERSECT to alter the order

By default, output is sorted ascending by column order (except for UNION ALL).

Column names of the first result set are used for output.

### MERGE

```sql

MERGE INTO table
   USING subquery
   ON (conditional_expression)
WHEN MATCHED THEN
   UPDATE SET
      col1 = val1
   DELETE WHERE
     conditional_expression
WHEN NOT MATCHED THEN
  INSERT (col1, col2)
    VALUES (v1, v2)
;
	
```
you can put additional conditional expressions also in the update and INSERT (for example when not matched insert, but only if the additional condition matches).

You can merge into a view / subquery, if it's updatable:

```sql
merge into
(select employee_id, first_name, last_name, commission_pct
 from employees
 where employee_id != 795) e

...

```

The problem is if we then have a WHEN NOT MATCHED INSERT with employee_id 795

#### USING
can again be a subquery.

#### WHEN MATCHED THEN UPDATE
Update clause doesn't specify the table name again, but otherwise it's the same

#### DELETE
Does not run without the update clause.

### Subsets of languages

 * Query Statements (SELECT)
 * Data Definition Language (DDL)
 * Data Manipulation Language (DML)
 * Transaction Control (COMMIT, ROLLBACK)
 * Session Control (ALTER SESSION)
 * System Control (ALTER SYSTEM)
 * Embedded SQL (Oracle Call Interface)

Easily forgotten DDL: GRANT, ALTER, AUDIT, FLASHBACK, PURGE

### Mixing DML and DDL
DDL commands perform an implicit commit (ALTER SESSION!)

#### To test: unshared session

### Transaction Processing
Use SAVEPOINT for partial rollbacks

SET TRANSACTION READ ONLY or READ/WRITE

SET CONSTRAINT - to defer constraints checking

You can put a WRITE NOWAIT to not wait for transaction commit.

ROLLBACK TO SAVEPOINT savepoint_name

### DDL - Creating and Manipulating Objects
TRUNCATE - you can DROP STORAGE. You can TRUNCATE on other schemas if you have the right (DROP ANY TABLE). CASCADE truncates tables having a reference to the table being truncated.

sub-object number (DATA_OBJECT_ID) and last DDL time change when we TRUNCATE.

won't run triggers.

#### Synonyms
Public or private (private by default). You can CREATE OR REPLACE

resolution order: object in schema, private synonym, public synonym.

rights: CREATE SYNONYM, CREATE ANY SYNONYM, CREATE PUBLIC SYNONYM

have a look in user_synonyms to see which synonyms you have.

#### Sequences and Identity columns
Sequence, accessed by CURRVAL, NEXTVAL

```sql

CREATE SEQUENCE sequence_name START WITH 1 INCREMENT BY 10

```

You can also have identity columns:

column_name datatype GENERATED AS IDENTITY

the options are the same as the sequence

### Managing Constraints with Indexes

NOT NULL constraint can only be defined inline.

#### UNIQUE
Index and constraint.

column_name datatype CONSTRAINT constraint_name UNIQUE

NULLs don't count!

#### Indexes
Can be invisible, compressed

CREATE ANY INDEX to do it on another schemas.

#### Primary key
Creates two objects and one constraint

#### Foreign key
If defined inline, there's no FOREIGN KEY keyword

add an index separately to not have to lock the whole table upon deletion (same as in SQL Server)


## PL/SQL

You can use %TYPE and %ROWTYPE to get types at runtime.

