DECLARE
    v_firstname employees.first_name%TYPE;
BEGIN
    FOR i IN 50 .. 102
    LOOP
        BEGIN
            SELECT first_name
            INTO v_firstname
            FROM employees
            WHERE employee_id = i;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    dbms_output.put_line('No row found for ' || i);
        END;
    END LOOP;
END;