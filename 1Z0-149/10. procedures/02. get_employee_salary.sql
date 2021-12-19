CREATE OR REPLACE PROCEDURE get_employee_salary
(p_employee_id employees.employee_id%TYPE,
p_salary OUT employees.salary%TYPE)
IS

BEGIN
    SELECT salary
    INTO p_salary
    FROM employees
    WHERE employee_id = p_employee_id;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(SQLCODE);
            dbms_output.put_line(SQLERRM);
END;