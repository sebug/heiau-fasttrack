CREATE OR REPLACE FUNCTION get_salary_tax
(p_salary employees.salary%TYPE)
RETURN NUMBER
IS
BEGIN
    IF p_salary < 5000 THEN
        RETURN p_salary * (10 / 100);
    ELSE
        RETURN p_salary * (15 / 100);
    END IF;
END;

SELECT first_name, last_name, salary, get_salary_tax(salary)
FROM employees
WHERE get_salary_tax(salary) > 500
ORDER BY get_salary_tax(salary) DESC;