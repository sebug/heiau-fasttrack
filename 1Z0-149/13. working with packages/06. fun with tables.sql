CREATE OR REPLACE PACKAGE table_fun
IS
    TYPE emp_table_type IS TABLE OF employees%rowtype
    INDEX BY BINARY_INTEGER;
    
    PROCEDURE get_employees(p_emps OUT emp_table_type);
END;

CREATE OR REPLACE PACKAGE BODY table_fun
IS
    PROCEDURE get_employees(p_emps OUT emp_table_type)
    IS
    BEGIN 
        FOR emp IN (SELECT * FROM employees)
        LOOP
            p_emps(emp.employee_id) := emp;
        END LOOP;
    END;
END;

DECLARE
    v_employees table_fun.emp_table_type;
BEGIN
    table_fun.get_employees(v_employees);
    dbms_output.put_line(v_employees(100).first_name);
END;