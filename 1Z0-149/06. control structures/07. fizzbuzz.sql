DECLARE
skip_round BOOLEAN;
BEGIN
FOR i IN 1 .. 100
    LOOP
        skip_round := false;
        IF MOD(i, 3) = 0 THEN
            dbms_output.put('Fizz');
            skip_round := true;
        END IF;
        IF MOD(i, 5) = 0 THEN
            dbms_output.put('Buzz');
            skip_round := true;
        END IF;
        IF skip_round THEN
            dbms_output.put_line('');
        END IF;
        
        CONTINUE WHEN skip_round;
        
        dbms_output.put_line(i);
    END LOOP;
END;