DECLARE
    s VARCHAR2(100);
BEGIN
    s := dbms_warning.get_warning_setting_string();
    dbms_output.put_line(s);
END;

CREATE OR REPLACE PROCEDURE p11
(p OUT VARCHAR2)
IS
BEGIN
    p := 'test';
    RETURN;
    p := 'other';
END;

SELECT * FROM user_plsql_object_settings
WHERE name = 'P11';

ALTER SESSION SET PLSQL_WARNINGS = 'ENABLE:ALL';

-- redo the procedure

SELECT * FROM user_errors
WHERE name = 'P11';