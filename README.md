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


