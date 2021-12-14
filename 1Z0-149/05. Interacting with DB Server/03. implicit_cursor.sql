DECLARE
rc NUMBER;
BEGIN
    UPDATE employees
    SET salary = salary;

    IF (SQL%found)
    THEN
        dbms_output.put_line(SQL%rowcount);
    END IF;
END;