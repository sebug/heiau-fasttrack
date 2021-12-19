DECLARE
    e_insert EXCEPTION;
    PRAGMA exception_init(e_insert, -01400);
BEGIN
    INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
    VALUES (277, NULL);
    EXCEPTION
        WHEN e_insert THEN
            dbms_output.put_line('It complained about inserting NULL');
            dbms_output.put_line(SQLCODE);
            dbms_output.put_line(SQLERRM);
END;