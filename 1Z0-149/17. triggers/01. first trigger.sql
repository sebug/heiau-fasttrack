DROP TABLE t1;

CREATE TABLE t1 (
    emp_id NUMBER,
    ename VARCHAR2(100)
);

INSERT INTO t1 VALUES (1, 'tiffany');
INSERT INTO t1 VALUES (2, 'anne-sophie');

CREATE OR REPLACE TRIGGER t1_before_update
BEFORE UPDATE
ON t1
BEGIN
    dbms_output.put_line(':/');
END;

UPDATE t1 SET ename = 'teophania'
WHERE ename = 'tiffany';

UPDATE t1 SET ename = 'The man in black'
WHERE emp_id = -1; -- statement trigger - even executes if there is no row
