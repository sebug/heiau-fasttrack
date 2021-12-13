declare
v_date date := sysdate;
v_sal number := 5000;
begin
/*
Multiline comments are like in C
Yay? */
dbms_output.put_line(v_date);
dbms_output.put_line(v_date - 3);
dbms_output.put_line(v_date + 8);
dbms_output.put_line(to_char(v_date, 'yyyy-mm-dd HH24:mi:ss'));
dbms_output.put_line(add_months(v_date, 2));
dbms_output.put_line(to_char(v_sal, q'{$999,999}'));
end;