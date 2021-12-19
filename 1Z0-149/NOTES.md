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


