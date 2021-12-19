CREATE OR REPLACE PROCEDURE update_sal
(p_emp_id IN NUMBER, p_amount IN NUMBER)
IS
BEGIN
    UPDATE employees
    SET salary = salary + p_amount
    WHERE employee_id = p_emp_id;
END;