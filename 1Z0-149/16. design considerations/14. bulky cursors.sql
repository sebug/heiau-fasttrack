DECLARE
    TYPE emp_t IS TABLE OF employees%ROWTYPE;
    emp_table emp_t;
    CURSOR emp_c IS SELECT * FROM employees;
BEGIN
    OPEN emp_c;
    
    FETCH emp_c
    BULK COLLECT INTO emp_table
    LIMIT 5;
    
    CLOSE emp_c;
    
    FOR i IN emp_table.first .. emp_table.last
    LOOP
        dbms_output.put_line('BC ' || emp_table(i).email);
    END LOOP;
END;