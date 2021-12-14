DECLARE
TYPE tab_no IS TABLE OF VARCHAR2(100)
INDEX BY PLS_INTEGER;
v_tab_no tab_no;
BEGIN
    v_tab_no(0) := 'Yup';
    v_tab_no(1) := 'There';
    v_tab_no(5) := 'He';
    v_tab_no(6) := 'Is';
    
    dbms_output.put_line(v_tab_no(1) || ' ' || v_tab_no(5) || ' ' || v_tab_no(6));
    -- dbms_output.put_line(v_tab_no(-1)); -- throws an error no data found
END;