CREATE OR REPLACE FUNCTION get_employee
    (p_employee_id NUMBER)
    RETURN employees%ROWTYPE
IS
    v_employee employees%ROWTYPE;
BEGIN
    EXECUTE IMMEDIATE '
    SELECT *
    FROM employees
    WHERE employee_id = :1'
    INTO v_employee
    USING p_employee_id;
    
    RETURN v_employee;
END;

DECLARE
    v_row employees%ROWTYPE;
BEGIN
    v_row := get_employee(200);
    dbms_output.put_line(v_row.email);
END;