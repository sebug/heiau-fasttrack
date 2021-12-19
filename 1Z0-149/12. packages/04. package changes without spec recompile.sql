CREATE OR REPLACE PACKAGE Variable_Stuff
IS
    the_answer VARCHAR2(255) := 'Hey hey';
END;

CREATE OR REPLACE PACKAGE BODY Variable_Stuff
IS
BEGIN
    dbms_output.put_line('Modifying the answer');
    the_answer := 'Modified answer';
END;

EXECUTE dbms_output.put_line(Variable_Stuff.the_answer);