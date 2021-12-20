DECLARE
    TYPE c_emp_dept IS REF CURSOR;
    d_cursor c_emp_dept;
    
    v_empno employees.employee_id%TYPE;
    v_firstname employees.first_name%TYPE;
BEGIN
    OPEN d_cursor FOR SELECT employee_id, first_name
                      FROM employees
                      WHERE department_id = 10;
    
    LOOP
        FETCH d_cursor INTO v_empno, v_firstname;
        EXIT WHEN d_cursor%NOTFOUND;
        dbms_output.put_line('Employee ' || v_empno || ' is ' || v_firstname);
    END LOOP;
    
    CLOSE d_cursor;
    
    OPEN d_cursor FOR SELECT employee_id, first_name
                      FROM employees
                      WHERE department_id = 30;
    
    LOOP
        FETCH d_cursor INTO v_empno, v_firstname;
        EXIT WHEN d_cursor%NOTFOUND;
        dbms_output.put_line('Employee ' || v_empno || ' is ' || v_firstname);
    END LOOP;
    
    CLOSE d_cursor;
END;