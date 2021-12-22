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

CREATE OR REPLACE FUNCTION get_blab
RETURN VARCHAR2
IS
    v_ret VARCHAR2(100);
BEGIN
    $IF $$nurbli = 5 $THEN
        v_ret := 'blab';
    $ELSE
        v_ret := 'bleh';
    $END
    RETURN v_ret;
END;

SELECT get_blab FROM dual;

ALTER SESSION set plsql_ccflags = 'language:1,nurbli:4';

SELECT get_blab FROM dual; -- Still blab!

ALTER FUNCTION get_blab COMPILE;

SELECT get_blab FROM dual; -- Now bleh

SELECT *
FROM user_plsql_object_settings
WHERE lower(name) = 'get_blab';