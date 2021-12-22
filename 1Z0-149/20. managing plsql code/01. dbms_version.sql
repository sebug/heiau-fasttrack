BEGIN
    dbms_output.put_line(dbms_db_version.version);
    dbms_output.put_line(dbms_db_version.release);
    IF dbms_db_version.ver_le_19 THEN
        dbms_output.put_line('Yup, version 19');
    END IF;
END;

SELECT text
FROM ALL_SOURCE
WHERE lower(name) = 'dbms_db_version'
ORDER BY line;