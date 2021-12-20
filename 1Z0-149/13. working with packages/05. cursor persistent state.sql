CREATE OR REPLACE PACKAGE cur_pkg
IS
    CURSOR c_emp IS
    SELECT employee_id
    FROM employees;
    
    PROCEDURE open_cursor;
    PROCEDURE close_cursor;
    PROCEDURE printnext_20;
END;

CREATE OR REPLACE PACKAGE BODY cur_pkg
IS
    PROCEDURE open_cursor
    IS
    BEGIN
        IF NOT c_emp%ISOPEN THEN
            OPEN c_emp;
        END IF;
    END;
    
    PROCEDURE close_cursor
    IS
    BEGIN
        IF c_emp%ISOPEN THEN
            CLOSE c_emp;
        END IF;
    END;
    
    PROCEDURE PRINTNEXT_20
    IS
        v_emp_id NUMBER;
    BEGIN
        FOR i in 1..20
        LOOP
            FETCH c_emp INTO v_emp_id;
            EXIT WHEN c_emp%NOTFOUND;
            dbms_output.put_line('Employee id ' || v_emp_id);
        END LOOP;
    END;
END;

BEGIN
    cur_pkg.open_cursor;
    cur_pkg.printnext_20;
    cur_pkg.printnext_20;
    cur_pkg.close_cursor;
END;