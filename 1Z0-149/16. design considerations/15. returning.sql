CREATE OR REPLACE PROCEDURE update_sal_x
    (emp_id NUMBER, p_amount NUMBER)
IS
    v_new_sal NUMBER;
BEGIN
    UPDATE employees
    SET salary = salary + p_amount
    WHERE employee_id = emp_id
    RETURNING salary INTO v_new_sal;
    
    dbms_output.put_line('New salary is ' || v_new_sal);
END;

EXECUTE update_sal_x(101, 20);

DROP TABLE ename_test;

CREATE TABLE ename_test
AS
SELECT employee_id, salary
FROM employees;

SELECT *
FROM ename_test;

DECLARE
    TYPE emp_t IS TABLE OF ename_test%ROWTYPE;
    emp_table emp_t := emp_t();
    emp_new_sal emp_t := emp_t();
BEGIN
    SELECT *
    BULK COLLECT INTO emp_table
    FROM ename_test;
    
    UPDATE ename_test
    SET salary = salary / 2
    RETURNING employee_id, salary BULK COLLECT INTO emp_new_sal;
        
    FOR i IN emp_new_sal.first .. emp_new_sal.last
    LOOP
        dbms_output.put_line(emp_new_sal(i).employee_id || ' -> ' || emp_new_sal(i).salary);
    END LOOP;
END;