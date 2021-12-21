CREATE OR REPLACE TRIGGER it_prog_range
BEFORE
INSERT OR UPDATE
ON employees
FOR EACH ROW
WHEN (new.job_id = 'IT_PROG')
DECLARE
    v_min_it_prog NUMBER;
    v_max_it_prog NUMBER;
BEGIN
    SELECT MIN(salary), MAX(salary)
    INTO v_min_it_prog, v_max_it_prog
    FROM employees
    WHERE job_id = :new.job_id;
    
    IF :new.salary NOT BETWEEN v_min_it_prog AND v_max_it_prog THEN
        raise_application_error(-20015, 'Invalid range');
    END IF;
END;

INSERT INTO employees (
employee_id, first_name, last_name, email, phone_number, hire_date,
job_id, salary, commission_pct, manager_id, department_id)
VALUES
(900, 'sib', 'sub', 'sib@gmail.com', NULL, sysdate, 'IT_PROG',
9100, NULL, NULL, 90);

UPDATE employees
SET salary = 26000
WHERE employee_id = 107;

-- solution: create a compound trigger
CREATE OR REPLACE TRIGGER it_prog_range
FOR
INSERT OR UPDATE
ON employees
WHEN (new.job_id = 'IT_PROG')
COMPOUND TRIGGER
    v_min_it_prog NUMBER;
    v_max_it_prog NUMBER;
BEFORE STATEMENT IS
BEGIN
    SELECT MIN(salary), MAX(salary)
    INTO v_min_it_prog, v_max_it_prog
    FROM employees
    WHERE job_id = 'IT_PROG';
END BEFORE STATEMENT;

BEFORE EACH ROW IS
BEGIN
    IF :new.salary NOT BETWEEN v_min_it_prog AND v_max_it_prog THEN
        raise_application_error(-20015, 'Invalid range');
    END IF;
END BEFORE EACH ROW;
END;