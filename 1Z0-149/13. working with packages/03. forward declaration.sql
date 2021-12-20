CREATE OR REPLACE PACKAGE proc_rules_calling2 -- package proc_rules_calling already exists, but somewhere we don't have access
IS
    PROCEDURE print_emp_details
    (p_employee_id NUMBER);
END;


CREATE OR REPLACE PACKAGE BODY proc_rules_calling2
IS
    FUNCTION get_no_workdays(p_emp_id NUMBER)
    RETURN NUMBER;

    PROCEDURE print_emp_details
    (p_employee_id NUMBER)
    IS
        v_employee employees%ROWTYPE;
    BEGIN
        SELECT *
        INTO v_employee
        FROM employees
        WHERE employee_id = p_employee_id;
        
        dbms_output.put_line(v_employee.first_name || ' - ' || get_no_workdays(p_employee_id));
    END;
    
    FUNCTION get_no_workdays(p_emp_id NUMBER)
    RETURN NUMBER
    IS
        v_hiredate DATE;
    BEGIN
        SELECT hire_date INTO v_hiredate
        FROM employees
        WHERE employee_id = p_emp_id;
        
        RETURN round(sysdate - v_hiredate);
    END;
END;

EXECUTE proc_rules_calling2.print_emp_details(100);