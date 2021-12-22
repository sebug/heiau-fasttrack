ALTER SESSION SET PLSQL_WARNINGS = 'DISABLE:ALL';

SELECT name, value
FROM v$parameter
WHERE name = 'plsql_warnings';

BEGIN
    dbms_warning.add_warning_setting_cat('SEVERE', 'ENABLE', 'SESSION');
END;

SELECT dbms_warning.get_warning_setting_num(6002) FROM dual;

SELECT dbms_warning.get_category(6002) FROM dual;