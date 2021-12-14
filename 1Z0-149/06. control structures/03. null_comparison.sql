DECLARE
x NUMBER := 5;
y NUMBER;
BEGIN
    IF x <> y THEN
        dbms_output.put_line('X not equal Y');
    ELSIF x = y THEN
        dbms_output.put_line('X equal Y');
    ELSE
        dbms_output.put_line('nope, nope');
    END IF;
END;