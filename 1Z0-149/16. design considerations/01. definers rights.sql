DROP TABLE hr_table;

CREATE TABLE hr_table
(
    id NUMBER,
    name VARCHAR2(100)
);

CREATE OR REPLACE PROCEDURE add_hr_table
(p_id NUMBER, p_name VARCHAR2)
IS
BEGIN
    INSERT INTO hr_table VALUES (p_id, p_name);
END;

GRANT EXECUTE ON add_hr_table TO detta;

-- Now detta can add items to hr_table even without access to the table itself.

SELECT * FROM hr_table;