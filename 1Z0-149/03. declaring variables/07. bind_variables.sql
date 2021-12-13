VARIABLE b_result number; -- for variables, can't have precision in numbers
-- you can use set autoprint on to automatically print variable content
begin
select (salary * 12) + nvl(commission_pct, 0) into :b_result
FROM employees where employee_id = 144;
end;
/
PRINT b_result;