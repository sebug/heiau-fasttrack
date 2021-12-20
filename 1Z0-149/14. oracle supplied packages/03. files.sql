SELECT * FROM employees;

DECLARE
    v_file UTL_FILE.FILE_TYPE;
    v_location VARCHAR2(100) := 'MYDIR';
    v_filename VARCHAR2(100) := 'sample.txt';
    v_text VARCHAR2(32767);
BEGIN
    v_file := utl_file.fopen(v_location, v_filename, 'r');
    utl_file.get_line(v_file, v_text);
    dbms_output.put_line('Line 1 is ' || v_text);
    utl_file.get_line(v_file, v_text);
    dbms_output.put_line('Line 2 is ' || v_text);
    utl_file.fclose(v_file);
END;

/

DECLARE
    v_file UTL_FILE.FILE_TYPE;
    v_location VARCHAR2(100) := 'MYDIR';
    v_filename VARCHAR2(100) := 'sample.txt';
    v_text VARCHAR2(32767);
    i INTEGER := 1;
BEGIN
    v_file := utl_file.fopen(v_location, v_filename, 'r');
    BEGIN
        LOOP
            utl_file.get_line(v_file, v_text);
            dbms_output.put_line('Line ' || i || ' is ' || v_text);
            i := i + 1;
        END LOOP;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('End of file reached');
    END;
    utl_file.fclose(v_file);
END;

DECLARE
    v_file UTL_FILE.FILE_TYPE;
    v_location VARCHAR2(100) := 'MYDIR';
    v_filename VARCHAR2(100) := 'departments.txt';
BEGIN
    v_file := utl_file.fopen(v_location, v_filename, 'w');
    FOR dep in (SELECT * FROM departments)
    LOOP
        utl_file.put_line(v_file, dep.DEPARTMENT_ID || CHR(9) || dep.department_name ||
            CHR(9) || dep.manager_id || CHR(9) || dep.location_id);
    END LOOP;
    utl_file.fclose(v_file);
    
    EXCEPTION
        WHEN utl_file.INVALID_PATH THEN
            dbms_output.put_line('Invalid path');
        WHEN utl_file.INVALID_MODE THEN
            dbms_output.put_line('Invalid mode');
        WHEN utl_file.INVALID_FILEHANDLE THEN
            dbms_output.put_line('Invalid file handle');
        WHEN utl_file.INVALID_OPERATION THEN
            dbms_output.put_line('Invalid operation');
        WHEN utl_file.READ_ERROR THEN
            dbms_output.put_line('Read error');
        WHEN utl_file.WRITE_ERROR THEN
            dbms_output.put_line('Write error');
        WHEN utl_file.INTERNAL_ERROR THEN
            dbms_output.put_line(SQLERRM);
END;