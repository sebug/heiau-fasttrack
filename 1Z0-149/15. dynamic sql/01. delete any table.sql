CREATE TABLE emp1 (
    emp_id NUMBER,
    CONSTRAINT PK_emp1 PRIMARY KEY(emp_id)
);

CREATE TABLE emp2 (
    emp_id NUMBER,
    CONSTRAINT PK_emp2 PRIMARY KEY(emp_id)
);

INSERT INTO emp1 (emp_id) VALUES (1);
INSERT INTO emp1 (emp_id) VALUES (2);
INSERT INTO emp1 (emp_id) VALUES (3);
INSERT INTO emp1 (emp_id) VALUES (4);
INSERT INTO emp1 (emp_id) VALUES (5);
INSERT INTO emp1 (emp_id) VALUES (6);

INSERT INTO emp2 (emp_id) VALUES (1);
INSERT INTO emp2 (emp_id) VALUES (2);
INSERT INTO emp2 (emp_id) VALUES (3);
INSERT INTO emp2 (emp_id) VALUES (4);
INSERT INTO emp2 (emp_id) VALUES (5);
INSERT INTO emp2 (emp_id) VALUES (6);

SELECT * FROM emp2;

CREATE OR REPLACE PROCEDURE delete_any_table
(p_table_name VARCHAR2)
IS
    v_no_rec NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM ' || p_table_name;
    v_no_rec := SQL%ROWCOUNT;
    COMMIT;
    dbms_output.put_line(v_no_rec || ' records deleted from table ' || p_table_name);
END;

EXECUTE delete_any_table('emp2');

SELECT * FROM emp2;