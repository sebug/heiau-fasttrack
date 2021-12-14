DECLARE
rc NUMBER;
BEGIN
    UPDATE employees
    SET salary = salary;

    IF (SQL%found)
    THEN
        dbms_output.put_line(SQL%rowcount);
        dbms_output.put_line('Second statement');
    END IF;
END;