SELECT *
FROM user_procedures;

SELECT *
FROM user_plsql_object_settings
WHERE PLSQL_CODE_TYPE <> 'INTERPRETED';

CREATE OR REPLACE PROCEDURE p1
IS
BEGIN
    dbms_output.put_line('Yay from p1');
    RETURN;
    dbms_output.put_line('Unreachable, hey!'); -- Should give a warning
END;

SELECT *
FROM user_plsql_object_settings
WHERE name = 'P1';

ALTER SESSION SET plsql_code_type = native;

ALTER PROCEDURE p1 COMPILE;

SELECT *
FROM user_plsql_object_settings
WHERE PLSQL_CODE_TYPE <> 'INTERPRETED';

EXECUTE p1;