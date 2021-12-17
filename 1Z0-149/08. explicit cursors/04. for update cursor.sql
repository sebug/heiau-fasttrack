DECLARE
CURSOR c_emp_deptno30 IS
SELECT first_name, last_name, salary
FROM employees
WHERE department_id = 30
ORDER BY 1
FOR UPDATE;
BEGIN
    FOR r in c_emp_deptno30
    LOOP
        UPDATE employees
        SET salary = salary + 11
        WHERE CURRENT OF c_emp_deptno30;
        dbms_output.put_line(r.first_name || ' ' || r.last_name || ' - ' || r.salary);
    END LOOP;
    
    COMMIT;
END;