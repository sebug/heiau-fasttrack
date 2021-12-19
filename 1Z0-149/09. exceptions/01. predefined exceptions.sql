DECLARE
    v_employee_firstname employees.first_name%TYPE;
BEGIN
    SELECT first_name
    INTO v_employee_firstname
    FROM employees
    WHERE employee_id = -1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Oh, nothing to see here');
END;