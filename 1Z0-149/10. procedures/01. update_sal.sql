CREATE OR REPLACE PROCEDURE update_sal
(p_emp_id NUMBER, p_amount NUMBER)
IS
BEGIN
    UPDATE employees
    SET salary = salary + p_amount
    WHERE employee_id = p_emp_id;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(SQLCODE);
            dbms_output.put_line(SQLERRM);
END;