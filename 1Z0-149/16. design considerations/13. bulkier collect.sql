DROP TABLE ename2;

CREATE TABLE ename2
AS SELECT employee_id, first_name
FROM employees;

DECLARE
    TYPE emp_t IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    emp_table emp_t;
BEGIN
    SELECT first_name
    BULK COLLECT INTO emp_table
    FROM ename2;
    
    FOR i in emp_table.first .. emp_table.last
    LOOP
        dbms_output.put_line(emp_table(i));
    END LOOP;
END;