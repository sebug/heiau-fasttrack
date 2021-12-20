DROP TABLE t;

CREATE TABLE t (
    test_value VARCHAR2(25)
);

CREATE OR REPLACE PROCEDURE child_block
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO t (test_value)
    VALUES ('Child block insert');
    
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE parent_block
IS
BEGIN
    INSERT INTO t (test_value)
    VALUES ('Parent Block insert');
    
    child_block;
    
    ROLLBACK;
END;

EXECUTE parent_block;

SELECT * FROM t;