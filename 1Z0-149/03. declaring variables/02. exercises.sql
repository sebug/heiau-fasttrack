declare
the_date DATE;
the_number NUMBER := 10;
the_name VARCHAR2(100) not null := 'sebastian'; -- have to initialize it directly to something
begin
dbms_output.put_line(the_date);
dbms_output.put_line(the_number);
dbms_output.put_line(the_name);
the_number := the_number + 10;
the_name := 'sebug';
dbms_output.put_line(the_name);
the_date := '12-September-2005';
dbms_output.put_line(the_date);
dbms_output.put_line(the_number);
end;
/

declare
type_prefixes_are_stupid_date date := sysdate;
another_number number := 10 * 2;
tau constant number := 6.28;
begin
dbms_output.put_line(tau);
-- tau := tau + 0.1; -- nope
end;