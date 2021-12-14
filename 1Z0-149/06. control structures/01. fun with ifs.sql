DECLARE
choice NUMBER := 10;
BEGIN
    IF choice = 10 THEN
        choice := choice - 1;
    ELSIF choice = 9 THEN
        choice := 42;
    ELSE
        choice := 55;
    END IF;
    dbms_output.put_line(choice);
END;

