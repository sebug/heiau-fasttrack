DECLARE
branch NVARCHAR2(6) := '*';
BEGIN
    FOR i IN 1 .. 5
    LOOP
        dbms_output.put_line(branch);
        branch := branch || '*';
    END LOOP;
END;
