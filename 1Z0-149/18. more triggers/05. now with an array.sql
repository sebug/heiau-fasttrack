DROP TRIGGER it_prog_range;

SELECT job_id, MIN(salary), MAX(salary)
FROM employees
GROUP BY job_id
ORDER BY 1;

CREATE OR REPLACE TRIGGER salary_range
FOR
INSERT OR UPDATE
ON employees
COMPOUND TRIGGER
    TYPE salary_range_t IS RECORD (
        minimum_salary NUMBER,
        maximum_salary NUMBER
    );
    TYPE salary_range_array_t IS TABLE OF salary_range_t INDEX BY VARCHAR2(100);
    salary_ranges salary_range_array_t := salary_range_array_t();
    BEFORE STATEMENT IS
    BEGIN
        FOR i IN (SELECT job_id, MIN(salary) min_salary, MAX(salary) max_salary
        FROM employees
        GROUP BY job_id)
        LOOP
            salary_ranges(i.job_id).minimum_salary := i.min_salary;
            salary_ranges(i.job_id).maximum_salary := i.max_salary;
        END LOOP;
    END BEFORE STATEMENT;
    
    BEFORE EACH ROW IS
        applicable_range salary_range_t;
    BEGIN
        applicable_range := salary_ranges(:new.job_id);
        
        IF :new.salary NOT BETWEEN applicable_range.minimum_salary AND applicable_range.maximum_salary THEN
            raise_application_error(-20015, 'Invalid range');
        END IF;
    END BEFORE EACH ROW;
END;

UPDATE employees
SET salary = 24700
WHERE employee_id = 100;