CREATE TABLE departments2
AS
SELECT *
FROM departments;

-- The exercise used departments directly to illustrate
-- the point that the trigger gets checked before the
-- table constraints

CREATE OR REPLACE PACKAGE department_trigger_exceptions IS
    e_delete_operation_not_allowed EXCEPTION;
    e_insert_operation_not_allowed EXCEPTION;
    e_update_operation_not_allowed EXCEPTION;
    PRAGMA exception_init(e_delete_operation_not_allowed, -20010);
    PRAGMA exception_init(e_insert_operation_not_allowed, -20011);
    PRAGMA exception_init(e_update_operation_not_allowed, -20012);
END;

CREATE OR REPLACE TRIGGER dept_check_time
BEFORE
INSERT OR UPDATE OR DELETE
ON departments2
BEGIN
    IF to_number(to_char(sysdate, 'hh24')) NOT BETWEEN 2 AND 3 THEN
        IF INSERTING THEN
            RAISE department_trigger_exceptions.e_insert_operation_not_allowed;
        ELSIF DELETING THEN
            RAISE department_trigger_exceptions.e_delete_operation_not_allowed;
        ELSIF UPDATING THEN
            RAISE department_trigger_exceptions.e_update_operation_not_allowed;
        END IF;
    END IF;
END;

DELETE FROM departments2;

SELECT * FROM user_objects
WHERE object_name = 'DEPT_CHECK_TIME';

SELECT * FROM user_triggers
WHERE trigger_name = 'DEPT_CHECK_TIME';
    
SELECT TO_NUMBER(TO_CHAR(sysdate, 'hh24')) FROM dual;