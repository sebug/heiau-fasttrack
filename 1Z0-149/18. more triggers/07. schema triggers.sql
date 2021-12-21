CREATE OR REPLACE TRIGGER before_create_trigger
BEFORE CREATE
ON SCHEMA
BEGIN
    IF to_number(to_char(sysdate, 'hh24')) NOT BETWEEN 1 AND 2 THEN
        raise_application_error(-20040, 'No new objects in this time period');
    END IF;
END;

ALTER TRIGGER before_create_trigger DISABLE;

CREATE TABLE test5 ( id NUMBER );