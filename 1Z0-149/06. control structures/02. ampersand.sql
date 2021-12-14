DECLARE
the_answer NUMBER := &v;
BEGIN
    IF the_answer = 42 THEN
        dbms_output.put_line('Yay!');
    ELSE
        dbms_output.put_line('Nay');
    END IF;
END;