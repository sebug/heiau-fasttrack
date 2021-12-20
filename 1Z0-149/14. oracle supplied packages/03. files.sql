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