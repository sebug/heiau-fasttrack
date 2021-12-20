CREATE OR REPLACE PACKAGE Persistent_state
IS
    PRAGMA SERIALLY_REUSABLE;
    g_var NUMBER := 10;
    PROCEDURE update_g_var
    (p_no NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY Persistent_state
IS
    PRAGMA SERIALLY_REUSABLE;

    PROCEDURE update_g_var
    (p_no NUMBER)
    IS
    BEGIN
        g_var := p_no;
        dbms_output.put_line(g_var);
    END;
END;


EXECUTE dbms_output.put_line(persistent_state.g_var);
EXECUTE persistent_state.update_g_var(23);
