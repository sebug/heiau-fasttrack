CREATE TABLE emp_copy
AS
SELECT * FROM employees;

SELECT * FROM emp_copy;

CREATE OR REPLACE TRIGGER check_sal
BEFORE
INSERT OR UPDATE
OF salary
ON emp_copy
FOR EACH ROW
BEGIN
    IF :new.salary < 500 THEN
        raise_application_error(-20013, 'Cannot have a salary less than 500');
    END IF;
END;

UPDATE emp_copy
SET salary = 499
WHERE employee_id = 100;

UPDATE emp_copy
SET salary = 499;

CREATE OR REPLACE TRIGGER check_sal
BEFORE
INSERT OR UPDATE
OF salary
ON emp_copy
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
BEGIN
    IF :n.salary < 500 THEN
        dbms_output.put_line('Cheapskate');
    END IF;
END;