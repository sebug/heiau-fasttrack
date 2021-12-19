CREATE OR REPLACE FUNCTION get_salary
(v_employee_id employees.employee_id%TYPE)
RETURN NUMBER
IS
v_sal NUMBER;
BEGIN
    SELECT salary
    INTO v_sal
    FROM employees
    WHERE employee_id = v_employee_id;
    
    RETURN v_sal;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
END;
