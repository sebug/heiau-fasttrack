CREATE TABLE tb1 (
    id NUMBER
);

CREATE VIEW vb1 AS
SELECT *
FROM tb1;

SELECT object_name, object_type, status FROM user_objects
WHERE object_name = 'VB1';

ALTER TABLE tb1 ADD name VARCHAR2(100);

SELECT object_name, object_type, status FROM user_objects
WHERE object_name = 'VB1'; -- stays valid, but we don't get the new column automatically

SELECT * FROM vb1;

