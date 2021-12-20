CREATE OR REPLACE PROCEDURE CREATE_ANY_TABLE
(p_table_name VARCHAR2, p_details VARCHAR2)
IS
    v_details VARCHAR2(30000);
BEGIN
    v_details := 'CREATE TABLE ' || p_table_name ||
       ' (
       ' || p_details || '
       )';
    dbms_output.put_line(v_details);
    EXECUTE IMMEDIATE v_details;
END;

EXECUTE create_any_table('emp5', 'emp_id NUMBER');


