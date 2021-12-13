declare
emp_name employees.first_name%TYPE := 'seb';
another_name emp_name%TYPE;
begin
another_name := 'other';
dbms_output.put_line(another_name);
end;