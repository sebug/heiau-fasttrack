DECLARE
x NUMBER := 5;
y NUMBER;
b BOOLEAN;
BEGIN
    IF x <> y THEN
        dbms_output.put_line('X not equal Y');
    ELSIF x = y THEN
        dbms_output.put_line('X equal Y');
    ELSE
        dbms_output.put_line('nope, nope');
    END IF;
    
    b := x <> y;
    
    IF b IS NULL THEN
        dbms_output.put_line('comparison value is null, which is falsy');
    END IF;
END;