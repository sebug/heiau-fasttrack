DECLARE
CURSOR c_emp_dept (v_dept_no NUMBER) IS
SELECT *
FROM employees
WHERE department_id = v_dept_no;

v_department NUMBER := &department_number;
BEGIN
    FOR r in c_emp_dept(v_department)
    LOOP
        dbms_output.put_line(r.email);
    END LOOP;
END;