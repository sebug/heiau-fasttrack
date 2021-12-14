DECLARE

TYPE Player IS RECORD (
    first_name employees.first_name%TYPE DEFAULT 'sebu',
    last_name employees.last_name%TYPE,
    is_present BOOLEAN
);

p Player;
BEGIN
    SELECT first_name, last_name
    INTO p.first_name, p.last_name
    FROM employees
    WHERE employee_id = 100;
    
    dbms_output.put_line(p.first_name);
    dbms_output.put_line(p.last_name);
END;