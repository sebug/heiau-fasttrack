DECLARE
    v_employee_id NUMBER := 1;
    e_invalid_no EXCEPTION;
BEGIN
    UPDATE employees
    SET salary = 2000
    WHERE employee_id = v_employee_id;
    
    dbms_output.put_line(SQL%ROWCOUNT);
    IF SQL%NOTFOUND THEN
        RAISE e_invalid_no;
    END IF;
    
    EXCEPTION
        WHEN e_invalid_no THEN
            dbms_output.put_line('As expected, invalid number');
END;
/

DECLARE
    v_employee_id NUMBER := 1;
BEGIN
    UPDATE employees
    SET salary = 2000
    WHERE employee_id = v_employee_id;
    
    dbms_output.put_line(SQL%ROWCOUNT);
    IF SQL%NOTFOUND THEN
        raise_application_error(-20000, 'Invalid employee ID');
    END IF;
END;