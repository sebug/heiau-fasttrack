CREATE OR REPLACE FUNCTION yay_parallel
    (p_id NUMBER)
    RETURN NUMBER
    PARALLEL_ENABLE
IS
BEGIN
    RETURN p_id * 2;
END;

SELECT /*+ PARALLEL(4) */
    first_name, yay_parallel(employee_id)
FROM employees;

SELECT
    first_name, yay_parallel(employee_id)
FROM employees;