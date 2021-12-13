declare
the_firstname employees.first_name%TYPE;
the_lastname employees.last_name%TYPE;
begin
select first_name, last_name
into the_firstname, the_lastname
from employees
where email = 'SKING';
dbms_output.put_line(the_firstname);
end;

