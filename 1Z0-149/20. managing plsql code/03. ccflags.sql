SELECT name, value
FROM v$parameter
WHERE name = 'plsql_ccflags';

ALTER SESSION set plsql_ccflags = 'language:1,nurbli:5';

BEGIN
    dbms_output.put_line($$language);
    dbms_output.put_line($$plsql_ccflags);
    dbms_output.put_line($$nurbli);
END;

-- I guess the idea is that we can then use that upon
-- compilation to choose a different code path depending
-- on these initial settings.

