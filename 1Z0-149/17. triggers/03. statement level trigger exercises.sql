CREATE TABLE departments2
AS
SELECT *
FROM departments;

CREATE OR REPLACE TRIGGER dept_check_time
BEFORE
INSERT OR UPDATE OR DELETE
ON departments2
BEGIN
    IF to_number(to_char(sysdate, 'hh24')) NOT BETWEEN 2 AND 3 THEN
        raise_application_error(-20010, 'DML Operations not allowed right now');
    END IF;
END;

DELETE FROM departments2;

SELECT * FROM user_objects
WHERE object_name = 'DEPT_CHECK_TIME';
    