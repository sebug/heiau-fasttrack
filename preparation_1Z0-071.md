# Preparations for 1Z0-071 (Oracle Database SQL)
This one shouldn't be too much of an issue, noting the potential gaps below.

## Entity-Relationship Diagrams
In SQL Developer, you can use the schema browser on a DB to see the entity
relationship diagrams as Oracle likes them - just click on a table and then
go to the model tab.

## Retrieving data using SELECT
Column aliases in Oracle are without the AS. Concatenation is with ||.
Substr takes length and is 1-indexed.

Alternate quote operators: q'<My quoted text's content>'.

DISTINCT works as in SQL Server, special consideration to be taken in count.

## Restricting and Sorting Data
Operator precedence: https://docs.oracle.com/cd/B19306_01/server.102/b14200/operators001.htm
and conditions: https://docs.oracle.com/cd/B19306_01/server.102/b14200/conditions001.htm#i1034834

AND binds more than OR.

### Limiting rows returned in a SQL statement
```sql
SELECT *
FROM employees
OFFSET 20 ROWS
FETCH FIRST 10 ROWS ONLY
```

https://oracle-base.com/articles/12c/row-limiting-clause-for-top-n-queries-12cr1

And then there's of course RANK and DENSE_RANK.

### Substitution Variables

```sql
DEFINE EMPLOYEE_ID_COLUMN = employee_id

SELECT &EMPLOYEE_ID_COLUMN from employees
```

The ones not DEFINEd are prompted.

```sql
SET VERIFY ON
```

Then if you run the script you see before & after substitution.

### Sorting
nulls first, column index.

## Single-Row functions
TRUNC is like floor, also works on dates.

### Date arithmetic
In fractions of a day, you can also minus to get a time span.

to_date to get the date in a specific format.

## Conversion functions
NULLIF to return NULL if the value matches the second argument (useful to avoid
divisions by zero).

TO_NUMBER to specify a format to parse with.

## Set operators
I should manage

## DDL
Columns unused: You can set columns to unused before dropping.

### Temporary tables
Not the same as in SQL Server - the table definition stays, it's just the
content that's cleared out.

