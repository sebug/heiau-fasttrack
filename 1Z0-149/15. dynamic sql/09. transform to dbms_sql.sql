CREATE OR REPLACE PROCEDURE delete_any_table2
(p_table_name VARCHAR2)
IS
v_no_rec NUMBER;
v_cur_id NUMBER;
BEGIN
    v_cur_id := dbms_sql.open_cursor;
    dbms_sql.parse(v_cur_id, 'DELETE FROM ' || p_table_name, dbms_sql.native);
    v_no_rec := dbms_sql.execute(v_cur_id);
    dbms_output.put_line(v_no_rec || ' records deleted from table ' || p_table_name || ' using cursor ' ||
        v_cur_id);
    COMMIT;
END;

EXECUTE delete_any_table2('emp1');