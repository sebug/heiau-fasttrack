ALTER SESSION SET plsql_ccflags = 'plsql_ccflags:true,debug:true,debug:0';

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_ccflags';

BEGIN
    dbms_output.put_line($$plsql_ccflags); -- Can't print a boolean
END;

CALL dbms_preprocessor.print_post_processed_source('function','hr3','get_blab');