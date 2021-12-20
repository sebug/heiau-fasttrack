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
- except if PRAGMA SERIALLY_REUSABLE


