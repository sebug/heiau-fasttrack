SELECT *
FROM employees
WHERE department_id = 30;

DECLARE
CURSOR c_emp_dpt30 IS
SELECT * FROM employees
WHERE department_id = 30;

v_emp_rec c_emp_dpt30%ROWTYPE; -- we could also reference the table
BEGIN
    IF NOT c_emp_dpt30%ISOPEN THEN
        OPEN c_emp_dpt30;
    END IF;
    
    LOOP
        FETCH c_emp_dpt30 INTO v_emp_rec;
        EXIT WHEN c_emp_dpt30%NOTFOUND; -- note the exit before the print -- the last time around the loop, we don't fetch anything into the variables.
        dbms_output.put_line(c_emp_dpt30%ROWCOUNT || ' ' || v_emp_rec.first_name || '-' || v_emp_rec.last_name);
    END LOOP;
    
    CLOSE c_emp_dpt30;
END;