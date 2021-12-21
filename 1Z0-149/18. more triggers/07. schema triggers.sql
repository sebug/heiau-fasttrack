CREATE OR REPLACE TRIGGER before_create_trigger
BEFORE CREATE
ON SCHEMA
BEGIN
    IF to_number(to_char(sysdate, 'hh24')) NOT BETWEEN 1 AND 2 THEN
        raise_application_error(-20040, 'No new objects in this time period');
    END IF;
END;

ALTER TRIGGER before_create_trigger DISABLE;

DROP TABLE ddl_log;

CREATE TABLE ddl_log (
    operation VARCHAR2(30),
    obj_owner VARCHAR2(30),
    object_name VARCHAR2(30),
    attempt_by VARCHAR2(30),
    attempt_date DATE
);

CREATE OR REPLACE TRIGGER ddl_trigger
AFTER DDL
ON SCHEMA
BEGIN
    INSERT INTO ddl_log
    SELECT ora_sysevent,
    ora_dict_obj_owner,
    ora_dict_obj_name,
    user,
    sysdate
    FROM dual;
END;

CREATE TABLE t5 ( id NUMBER );

SELECT * FROM ddl_log;