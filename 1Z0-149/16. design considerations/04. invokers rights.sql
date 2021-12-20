CREATE OR REPLACE PROCEDURE add_hr_table
(p_id NUMBER, p_name VARCHAR2) AUTHID CURRENT_USER -- so now I need rights on hr_table as well
IS
BEGIN
    INSERT INTO hr_table VALUES (p_id, p_name);
END;