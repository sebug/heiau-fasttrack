CREATE OR REPLACE FUNCTION get_sal
(p_emp_id NUMBER)
RETURN NUMBER $IF dbms_db_version.version >= 11 $THEN RESULT_CACHE $END
IS
    v_sal NUMBER;
BEGIN
    SELECT salary
    INTO v_sal
    FROM employees
    WHERE employee_id = p_emp_id;
    
    RETURN v_sal;
END;

-- Directives
BEGIN
    dbms_output.put_line($$plsql_code_type);
    dbms_output.put_line($$plsql_optimize_level);
    dbms_output.put_line($$plsql_warnings);
END;

CREATE OR REPLACE PROCEDURE g_test
IS
BEGIN
    $IF $$plsql_optimize_level <> 2 $THEN
        $ERROR 'It should be compiled with optimize level 2' $END
    $END
    dbms_output.put_line('test');
END;