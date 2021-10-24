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

