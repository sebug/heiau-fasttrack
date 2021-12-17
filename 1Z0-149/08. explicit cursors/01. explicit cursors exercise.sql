SELECT *
FROM employees
WHERE department_id = 30;

DECLARE
CURSOR c_emp_dpt30 IS
SELECT employee_id, first_name FROM employees
WHERE department_id = 30;

v_empno employees.employee_id%TYPE;
v_first_name employees.first_name%TYPE;
BEGIN
    OPEN c_emp_dpt30;
    
    LOOP
        FETCH c_emp_dpt30 INTO v_empno, v_first_name;
        EXIT WHEN c_emp_dpt30%NOTFOUND; -- note the exit before the print -- the last time around the loop, we don't fetch anything into the variables.
        dbms_output.put_line(v_empno || '-' || v_first_name);
    END LOOP;
    
    CLOSE c_emp_dpt30;
END;