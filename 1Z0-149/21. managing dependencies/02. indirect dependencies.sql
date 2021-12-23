CREATE VIEW secondary_view_a
AS
SELECT *
FROM dependent_view_a;

SELECT * FROM user_dependencies
WHERE name = 'SECONDARY_VIEW_A';