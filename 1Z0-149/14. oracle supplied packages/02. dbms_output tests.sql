BEGIN
    FOR i IN 1 .. 30000 -- big enough to go over the buffer size
    LOOP
        dbms_output.put_line(lpad(i, 7, '#'));
    END LOOP;
END;

BEGIN
    dbms_output.enable(1000000);
    FOR i IN 1 .. 30000 -- now it should fit
    LOOP
        dbms_output.put_line(lpad(i, 7, '#'));
    END LOOP;
END;

-- messages are not sent until PL/SQL completed
BEGIN
    dbms_output.put_line('Line 1');
    dbms_output.disable; -- buffer is gone
    dbms_output.put_line('Line 2'); -- currently disabled
    dbms_output.enable;
    dbms_output.put_line('Line 3'); -- only this one is seen
END;

DECLARE
    v_buffer VARCHAR(100);
    v_status INTEGER;
BEGIN
    dbms_output.put_line('Line 1');
    dbms_output.put_line('Line 2');
    dbms_output.get_line(v_buffer, v_status);
    dbms_output.put_line('Got the line from the buffer: ' || v_buffer);
    dbms_output.put_line('Status is ' || v_status);
END;

DECLARE
    v_full_buffer dbms_output.CHARARR;
    v_line INTEGER;
BEGIN
    v_line := 20;
    dbms_output.put_line('Line 1');
    dbms_output.put_line('Line 2');
    dbms_output.put_line('Line 3');
    dbms_output.put_line('Line 4');
    dbms_output.get_lines(v_full_buffer, v_line);
    FOR i in reverse 1 .. v_line
    LOOP
        dbms_output.put_line(i || ': ' || v_full_buffer(i));
    END LOOP;
END;
