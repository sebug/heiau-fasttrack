CREATE TABLE referenced_a (
   id NUMBER
);

INSERT INTO referenced_a (id) VALUES (1);
INSERT INTO referenced_a (id) VALUES (2);
INSERT INTO referenced_a (id) VALUES (3);

CREATE VIEW dependent_view_a
AS
SELECT id
FROM referenced_a;

SELECT * FROM dependent_view_a;

DROP TABLE referenced_a;

SELECT object_name, status
FROM user_objects
WHERE object_name = 'DEPENDENT_VIEW_A';

SELECT * FROM dependent_view_a; -- interesting: if we re-create the table, the view initially stays invalid until first execution.
