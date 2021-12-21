CREATE OR REPLACE FUNCTION get_sum_sal_dep
    (dept_id NUMBER)
RETURN NUMBER RESULT_CACHE -- no longer need to specify relies_on
IS
    v_sal NUMBER;
BEGIN
    SELECT SUM(salary)
    INTO v_sal
    FROM employees
    WHERE department_id = dept_id;
    
    RETURN v_sal;
END;

SELECT get_sum_sal_dep(30) FROM dual;