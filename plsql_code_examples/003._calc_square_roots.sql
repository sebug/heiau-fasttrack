create or replace procedure calc_squares is
    start_value number := 2;
    end_value number := 5;
    calc_sqrt float;
begin
    for iterator in start_value .. end_value
    loop
        calc_sqrt := sqrt(iterator);
        if calc_sqrt >= 2 then
            exit;
        end if;
        dbms_output.put_line('Sqrt of ' || iterator || ' is ' || calc_sqrt);
    end loop;
end;
/