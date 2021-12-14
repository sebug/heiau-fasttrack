begin <<outer>>
declare
the_number number := 23;
begin
    declare
    the_number number := 42;
    begin
        dbms_output.put_line(outer.the_number);
        dbms_output.put_line(the_number);
    end;
end;
end outer; -- Oracle doesn't even care if you don't put it here.