SELECT *
FROM employees
WHERE employee_id IN (100, 101, 102)

CREATE OR REPLACE PROCEDURE update_sal_without_bulk
    (p_amount NUMBER)
IS
    TYPE emp_table_type IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    emp_table emp_table_type;
BEGIN
    emp_table(1) := 100;
    emp_table(2) := 101;
    emp_table(3) := 102;
    
    FOR i IN emp_table.first .. emp_table.last
    LOOP
        UPDATE employees
        SET salary = salary + p_amount
        WHERE employee_id = emp_table(i);
    END LOOP;
    
    COMMIT;
END;

EXECUTE update_sal_without_bulk(100);

CREATE OR REPLACE PROCEDURE update_sal_with_bulk
    (p_amount NUMBER)
IS
    TYPE emp_table_type IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    emp_table emp_table_type;
BEGIN
    emp_table(1) := 100;
    emp_table(2) := 101;
    emp_table(3) := 102;
    
    FORALL i IN emp_table.first .. emp_table.last
        UPDATE employees
        SET salary = salary + p_amount
        WHERE employee_id = emp_table(i);
    
    COMMIT;
END;

EXECUTE update_sal_with_bulk(100);