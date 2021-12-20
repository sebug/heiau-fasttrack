DECLARE
    v_ename VARCHAR2(100);
    v_no NUMBER := 200;
BEGIN
    EXECUTE IMMEDIATE 'SELECT first_name FROM employees WHERE employee_id = :1'
        INTO v_ename
        USING v_no;
        
    dbms_output.put_line('The ename is ' || v_ename);
END;