DECLARE
total_salary NUMBER;
BEGIN
    SELECT SUM(salary)
    INTO total_salary
    FROM employees
    WHERE department_id = &dep;
    
    IF total_salary IS NULL THEN
        RAISE NO_DATA_FOUND;
    END IF;
    
    dbms_output.put_line(total_salary);
END;