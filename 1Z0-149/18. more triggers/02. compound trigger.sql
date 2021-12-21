DROP TABLE test_emp;

CREATE TABLE test_emp (
    emp_id NUMBER,
    first_name VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER comp_t
FOR INSERT OR UPDATE OR DELETE
ON test_emp
COMPOUND TRIGGER
    BEFORE STATEMENT IS
    BEGIN
        dbms_output.put_line('Before statement');
    END BEFORE STATEMENT;
    AFTER STATEMENT IS
    BEGIN
        dbms_output.put_line('After statement');
    END AFTER STATEMENT;
END;

INSERT INTO test_emp (emp_id, first_name) VALUES (1, 'seb');