DECLARE
    TYPE t_locations IS VARRAY(3) OF VARCHAR2(100);
    loc t_locations;
BEGIN
    loc := t_locations('Schaffhausen','Zürich','Chur');
    
    FOR i in loc.first..loc.last
    LOOP
        dbms_output.put_line(loc(i));
    END LOOP;
END;