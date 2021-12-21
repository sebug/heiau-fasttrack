DROP TABLE emp;

CREATE TABLE emp (
    id NUMBER,
    name VARCHAR2(100)
);

DROP TABLE which_fired_first;

CREATE TABLE which_fired_first (
    seq_id NUMBER,
    trigger_name VARCHAR2(100)
);

CREATE SEQUENCE fire_sequence;

CREATE OR REPLACE TRIGGER t1
BEFORE
INSERT
ON emp
FOR EACH ROW
BEGIN
    INSERT INTO which_fired_first (seq_id, trigger_name)
    VALUES (fire_sequence.nextval, 't1');
END;

CREATE OR REPLACE TRIGGER t2
BEFORE
INSERT
ON emp
FOR EACH ROW
FOLLOWS t1
BEGIN
    INSERT INTO which_fired_first (seq_id, trigger_name)
    VALUES (fire_sequence.nextval, 't2');
END;

INSERT INTO emp (id, name)
SELECT 1, 'seb' FROM dual
UNION
SELECT 2, 'sebu' FROM dual;