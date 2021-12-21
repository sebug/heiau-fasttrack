# Notes Course

## Stored procedures
In SQL*Plus, you can use show errors to show the compilation errors (they
are also in the user_errors table).

You can use ed to edit the last command.

## Functions
If you want to call them in SQL, they can only take IN parameters and
get, return SQL valid data types.

Can't be used in check constraints and can't be used as default values for a column.

Can't do DML if the function is used in the query.

You can't call a query on the table currently being updated or deleted
either (kinda makes sense for determinism).

The function will be compiled, it will just fail on execution.

## Packages
We can only see the stuff defined in the package specification from the
outside.

We can also change the spec or body separately (body: between begin/end,
private stuff, spec: additional variables).

If we do a major change that requires recompiling the body, it gives an
error upon execution if that wasn't done yet.

Packages are in user_objects (PACKAGE and PACKAGE BODY) and user_source.

can drop package body without specification as well.

### Overloading
Only available inside package? I see what you're doing there :-)

As for overloads that can't be distinguished, it will complain upon
EXECUTE - too many procedures match this call.

Functions with different return type - doesn't work, as expected.

### Persistent state of the package
- Unique per session.
- except if PRAGMA SERIALLY_REUSABLE, then it is per execution.

## Oracle-Supplied packages
get_line / get_lines take from the buffer (not, say, stdin).

### UTL_MAIL
I'm not really feeling setting this up. Primary procedures:

	SEND
	SEND_ATTACH_RAW
	SEND_ATTACH_VARCHAR2

To set up:

	ALTER SYSTEM SET SMTP_OUT_SERVER = '...msx001'

When sending with attachment, obtain some RAW bytes and attach them.

## Dynamic SQL
Native Dynamic SQL: Execute immediate. Otherwise DBMS_SQL.

DDL - have to have rights directly and not through a role.

## Design Considerations
- Put Constants and exceptions using a bodyless package.

RAISE_APPLICATION_ERROR takes a third parameter that, when set to true, does not replace the oracle error code, adding it instead.

Local subprograms - have the advantage that you don't have to expose them
outside the block.

Invoker's rights - AUTHID CURRENT_USER (AUTHID DEFINER is the other option).

Then you also need rights on the underlying objects.

### Autonomous Transactions
Independent of the main transaction. They are started and ended by
individual subprograms - can't use them in anonymous blocks.

### NOCOPY
For OUT / IN OUT parameters. IN parameters are always passed by reference,
which is easy because you can't reassign anyway.

Basically the issue is when the called subprogram throws - if we passed
by reference we have no guarantee that the value wasn't already changed.

NOCOPY doesn't work when:
- element of an indexed array
- is constrained
- records using ROWTYPE or TYPE.

### PARALLEL_ENABLE


