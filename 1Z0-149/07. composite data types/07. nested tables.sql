DECLARE
    TYPE t_location IS TABLE OF locations.city%TYPE;
    offices t_location;
BEGIN
    offices := t_location('Burgdorf','Bern');
    FOR i in offices.first..offices.last
    LOOP
        dbms_output.put_line(offices(i));
    END LOOP;
END;