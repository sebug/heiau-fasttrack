DECLARE
    v_tel VARCHAR2(25) := '+4122123123';
BEGIN
    dbms_output.put_line(v_tel);
    format_tel(v_tel);
    dbms_output.put_line(v_tel);
END;