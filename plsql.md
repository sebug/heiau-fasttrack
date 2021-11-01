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


