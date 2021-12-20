CREATE OR REPLACE PROCEDURE emp_list (p_dept_id NUMBER := NULL)
IS
    TYPE c_emp_dept IS REF CURSOR;
    d_cursor c_emp_dept;
    v_empno employees.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_sql VARCHAR2(1000) := 'SELECT employee_id, first_name FROM employees';
BEGIN
    IF p_dept_id IS NULL
    THEN
        OPEN d_cursor FOR v_sql;
    ELSE
        v_sql := v_sql || ' WHERE department_id = :1';
        OPEN d_cursor FOR v_sql USING p_dept_id;
    END IF;
    
    LOOP
        FETCH d_cursor INTO v_empno, v_first_name;
        EXIT WHEN d_cursor%NOTFOUND;
        dbms_output.put_line('Employee ' || v_empno || ' has first name ' || v_first_name);
    END LOOP;
    
    CLOSE d_cursor;
END;

EXECUTE emp_list(10);