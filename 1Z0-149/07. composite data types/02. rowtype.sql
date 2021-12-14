DECLARE
emp employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp
    FROM employees
    WHERE employee_id = 103;
    
    dbms_output.put_line(emp.first_name);
END;