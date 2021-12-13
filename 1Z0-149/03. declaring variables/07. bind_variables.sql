VARIABLE b_result number;
begin
select (salary * 12) + nvl(commission_pct, 0) into :b_result
FROM employees where employee_id = 144;
end;
/
PRINT b_result;