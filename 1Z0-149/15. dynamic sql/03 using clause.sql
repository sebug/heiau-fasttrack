CREATE OR REPLACE PROCEDURE add_rows
(p_table_name VARCHAR2, p_value NUMBER)
IS
BEGIN
    EXECUTE IMMEDIATE 'INSERT INTO ' || p_table_name ||
        ' VALUES(:x) '
    USING
        p_value;
END;

EXECUTE add_rows('emp1',8);

SELECT * FROM emp1;