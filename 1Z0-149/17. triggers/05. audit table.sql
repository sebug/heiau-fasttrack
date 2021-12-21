DROP TABLE emp_copy;

CREATE TABLE emp_copy
AS
SELECT * FROM employees;

SELECT * FROM emp_copy;

CREATE TABLE emp_salary_audit (
    employee_id NUMBER,
    operation VARCHAR2(20),
    old_sal NUMBER,
    new_sal NUMBER,
    op_date DATE,
    by_user VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER check_sal
AFTER
INSERT OR UPDATE OF salary OR DELETE
ON emp_copy
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO emp_salary_audit (employee_id,
        operation, 
        old_sal,
        new_sal,
        op_date,
        by_user) VALUES (
            :new.employee_id,
            'INSERT',
            NULL,
            :new.salary,
            sysdate,
            USER
        );
    ELSIF UPDATING THEN
        INSERT INTO emp_salary_audit (employee_id,
        operation, 
        old_sal,
        new_sal,
        op_date,
        by_user) VALUES (
            :new.employee_id,
            'UPDATE',
            :old.salary,
            :new.salary,
            sysdate,
            USER
        );
    ELSIF DELETING THEN
    INSERT INTO emp_salary_audit (employee_id,
        operation, 
        old_sal,
        new_sal,
        op_date,
        by_user) VALUES (
            :new.employee_id,
            'DELETE',
            :old.salary,
            NULL,
            sysdate,
            USER
        );
    END IF;
END;

UPDATE emp_copy
SET salary = 499
WHERE employee_id = 100;

SELECT * FROM emp_salary_audit;

UPDATE emp_copy
SET salary = 499;

