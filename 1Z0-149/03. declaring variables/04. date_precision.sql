declare
as_date DATE := sysdate;
prec0 TIMESTAMP(0) := sysdate;
prec1 TIMESTAMP(1) := sysdate;
prec2 TIMESTAMP(2) := sysdate;
prec6 TIMESTAMP(6) := sysdate;
prec9 TIMESTAMP(9) := sysdate;
ts_with_timezone TIMESTAMP WITH TIME ZONE := current_timestamp;
ts_with_localtimezone TIMESTAMP WITH LOCAL TIME ZONE := sysdate;
some_time_ago TIMESTAMP WITH LOCAL TIME ZONE := '12-jan-2019';
itvl interval year to month;
begin
dbms_output.put_line(as_date);
dbms_output.put_line(prec0);
dbms_output.put_line(prec1);
dbms_output.put_line(prec2);
dbms_output.put_line(prec6);
dbms_output.put_line(prec9);
dbms_output.put_line(ts_with_timezone);
dbms_output.put_line(ts_with_localtimezone);
itvl := '12-1';
dbms_output.put_line(itvl);
end;