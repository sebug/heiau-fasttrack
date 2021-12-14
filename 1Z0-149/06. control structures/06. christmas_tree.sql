BEGIN
    <<outer_loop>>
    FOR i IN 1 .. 5
    LOOP
        <<inner_loop>>
        FOR j in 1 .. i
        LOOP
            dbms_output.put('*');
        END LOOP;
        dbms_output.put_line('');
    END LOOP;
END;
