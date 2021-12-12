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