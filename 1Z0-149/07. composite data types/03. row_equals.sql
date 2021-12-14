CREATE TABLE departments_copy AS
SELECT *
FROM departments_copy;

DECLARE
dep departments_copy%ROWTYPE;
BEGIN
SELECT *
INTO dep
FROM departments
WHERE department_id = 10;

INSERT INTO departments_copy VALUES dep;

END;

/

DECLARE
dep departments_copy%ROWTYPE;
BEGIN
    SELECT *
    INTO dep
    FROM departments_copy
    WHERE department_id = 10;
    
    dep.department_name := 'Suppli';
    
    UPDATE departments_copy
    SET row = dep
    WHERE department_id = 10;
END;