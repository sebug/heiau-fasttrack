CREATE OR REPLACE PROCEDURE print_employee
(emp employees%ROWTYPE)
IS
BEGIN
    dbms_output.put_line(emp.employee_id || ' - ' || emp.first_name);
END;

DECLARE
CURSOR employee_cursor IS
SELECT *
FROM employees;
BEGIN
    FOR emp in employee_cursor
    LOOP
        print_employee(emp);
    END LOOP;
END;