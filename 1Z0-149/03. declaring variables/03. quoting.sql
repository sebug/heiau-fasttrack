declare
quoted_var VARCHAR2(100) DEFAULT q'?It's about time?';
begin
dbms_output.put_line(quoted_var);
end;