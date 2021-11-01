# PL/SQL

## Creating Functions and Procedures
You'll need the CREATE PROCEDURE rights to create, and EXECUTE to run.

### Procedures
Can be anonymous.

exec, named parameters with the => syntax.

exec creates an anonymous block begin...end, but you can also just do that
yourself.

You'll only need the declare keyword when creating an anonymous block,
otherwise it's is

Allowed data types - all that are allowed for columns.

You can directly declare variables with a value := , also with constant.

salary employees.salary%type := 20000

You can use %rowtype to get the type of a whole row of a table.

Variables are null if not initialized.

#### Cursors
cursor declaration 1 in the declare section, optional.

Can also be implicit:

```sql
for empval in (select * from employees)
loop
...
end looop;
```

if you have an implicit cursor, you get the information in sql% variables like sql%rowcount

### Security Model
Definer rights - default, invoker rights, but EXECUTE you'll need anyway.

AUTHID CURRENT_USER or AUTHID DEFINER

this defines in which schema we run.

To be sure the right table is used, specify the schema.

The security model changes in stored procedures.

If a procedure is created with definer rights, all roles are disabled.

### Blocks
Can be labeled, declare optional.

begin ... exception ... end;

If we have labels, we can qualify variables with it.

### For loops

```sql
for iterator in reverse 1 .. 10
loop

end loop;
```

You can also for in a select statement.

### While loop
Evaluating to null exits as well.

### Loop
like while 1 = 1, so we need an exit condition.

exit when to specify a condition for exiting.

### if
elsif

### SELECT INTO and BULK COLLECT
Other than SQL Server result sets, in PL/SQL we have to use select into in
procedures (if there's one row) and BULK COLLECT if there are multiple.

SQL%ROWCOUNT, SQL%FOUND and SQL%NOTFOUND for context.

There is an error message if SELECT INTO doesn't return exactly one row.

SQL%ISOPEN to check whether a cursor is still open.

### Dynamic SQL
Runs SQL statements that can't be run as static SQL in PL/SQL

 * CREATE, DROP TABLE
 * GRANT, REVOKE system or object privilege
 * TRUNCATE TABLE
 * ALTER SESSION, ALTER SYSTEM


```sql
execute immediate 'insert into departments_archive select * from departments';
```

execute immediate into

if you use bind variables :a, :b you execute immediate using

### Exception handling
EXCEPTION WHEN

Types of error codes: internal (ORA-...), predefined (NO_DATA_FOUND) or user
defined.

```sql
declare
	missing_table exception;
	pragma exception_init(missing_table, -942);
begin
	...
	exception
		when missing_table then
		...
		when others then
		...
end
```

### User-defined exceptions
in the declare, giving it the type exception, then raise

### Catching when others
You can use sqlcode and sqlerrm pre-defined variables.

## User-Defined Types
Max sizes of predefined types may be shorter.

use MAX_STRING_SIZE for example to adapt.

### CLOB
EMPTY_CLOB() and DBMS_LOAD.APPEND to construct a big clob.

### Use the returning clause to get what was inserted.
returning paper_text into lob_loc

### PL/SQL only types
BOOLEAN, PLS_INTEGER

#### Subtypes
Stuff is stored in the main type, but we ensure additional constraints.

 * NATURAL
 * NATURALN (not null)
 * POSITIVE
 * POSITIVEN
 * SIGNTYPE -1, 0, 1
 * SIMPLE_INTEGER PLS_INTEGER but not NULL

### Using type with TABLE functions
function pipelined

create type t_obj_row as object (...)

create type t_obj_table is table of t_obj_row;

```sql
create or replace function trans_oltp
return t_obj_table pipelined is
begin
...
pipe row
...
return;
end;

```
