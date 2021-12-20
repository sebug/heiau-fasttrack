CREATE OR REPLACE PACKAGE override
IS
    FUNCTION to_char(p1 NUMBER, p2 DATE)
    RETURN VARCHAR2;
    
    PROCEDURE print;
END;

CREATE OR REPLACE PACKAGE BODY override
IS
    FUNCTION to_char(p1 NUMBER, p2 DATE)
    RETURN VARCHAR2
    IS
    BEGIN
        RETURN p1 || p2;
    END;
    
    PROCEDURE print
    IS
    BEGIN
        dbms_output.put_line(to_char(1, sysdate));
 --       dbms_output.put_line(to_char(1)); -- won't work, since the to_char available doesn't have a 1 arg version
        dbms_output.put_line(standard.to_char(1));
    END;
END;

EXECUTE override.print;