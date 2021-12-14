-- Can't directly use data definition language or data
-- control language in PL/SQL - You can through dynamic SQL though.
DECLARE
my_employee number;
BEGIN
--CREATE TABLE samples ( sample_id number(6) primary key);
-- won't work
-- SELECT needs INTO
SELECT employee_id
INTO my_employee
FROM employees
WHERE email = 'SKING';
END;