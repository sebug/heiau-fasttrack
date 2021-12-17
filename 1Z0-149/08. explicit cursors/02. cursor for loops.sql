DECLARE
CURSOR c_emp_dpt30 IS
SELECT *
FROM employees
WHERE department_id = 30;
BEGIN
    FOR r IN c_emp_dpt30
    LOOP
        dbms_output.put_line(r.first_name || ' ' || r.last_name);
    END LOOP;
END;