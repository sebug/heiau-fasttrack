DECLARE
    v_employee_firstname employees.first_name%TYPE;
BEGIN
    SELECT first_name
    INTO v_employee_firstname
    FROM employees
    WHERE first_name = &name;
    
    dbms_output.put_line(v_employee_firstname);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Oh, nothing to see here');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('Too much to see here');
        WHEN OTHERS THEN
            dbms_output.put_line('Something else');
END;