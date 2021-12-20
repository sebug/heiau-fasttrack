CREATE OR REPLACE PACKAGE Variable_Stuff
IS
    the_answer VARCHAR2(255) := 'Hey hey';
    FUNCTION xx
    RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY Variable_Stuff
IS
    FUNCTION xx
    RETURN NUMBER
    IS
    BEGIN
        RETURN 10;
    END;
BEGIN
    dbms_output.put_line('Modifying the answer...');
    the_answer := 'Modified answer';
END;

EXECUTE dbms_output.put_line(Variable_Stuff.xx);