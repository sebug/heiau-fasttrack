SELECT name, open_mode
FROM v$pdbs;

SELECT name, value
FROM v$parameter
WHERE name = 'remote_dependencies_mode';