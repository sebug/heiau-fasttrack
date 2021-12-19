VARIABLE b_salary NUMBER;

EXECUTE get_employee_salary(100, :b_salary);

PRINT b_salary;