DROP TABLE ename;

CREATE TABLE ename
AS SELECT DISTINCT first_name FROM employees;

SELECT * FROM ename;

DECLARE
    TYPE ename_t IS TABLE OF VARCHAR2(100);
    ename_table ename_t := ename_t();
    c NUMBER := 0;
    error_count NUMBER;
BEGIN
    SELECT first_name
    BULK COLLECT INTO ename_table
    FROM ename;
    
    FORALL i IN ename_table.first .. ename_table.last
        SAVE EXCEPTIONS
        
        UPDATE ename
        SET first_name = first_name || ' to be added'
        WHERE first_name = ename_table(i);
    
    EXCEPTION
        WHEN OTHERS THEN
            error_count := SQL%BULK_EXCEPTIONS.count;
            dbms_output.put_line(error_count || ' errors occurred');
            FOR j in 1 .. error_count
            LOOP
                dbms_output.put_line('The error iteration is ' ||
                    SQL%BULK_EXCEPTIONS(j).error_index);
                dbms_output.put_line('The error code is ' ||
                    SQL%BULK_EXCEPTIONS(j).error_code);
                dbms_output.put_line('The error message is ' ||
                    sqlerrm(- SQL%BULK_EXCEPTIONS(j).error_code));
            END LOOP;
END;