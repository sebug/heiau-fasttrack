begin
dbms_output.put_line('lookee, an anonymous block');
dbms_output.put_line('can have more than one, of course');
end;

declare
begin
dbms_output.put_line('Can also have an empty declare');
end;

declare
v number;
begin
v := 47;
dbms_output.put('The answer to live, the universe and everything, adjusted for inflation is');
dbms_output.put_line(v);
end;