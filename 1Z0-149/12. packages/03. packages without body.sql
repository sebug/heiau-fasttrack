CREATE OR REPLACE PACKAGE global_Measurement
IS
    c_mile_to_km CONSTANT NUMBER := 1.6093;
    c_km_to_mile CONSTANT NUMBER := 1 / c_mile_to_km;
END;

DECLARE
    FUNCTION get_miles_from_km
        (p_km NUMBER)
    RETURN NUMBER
    IS
    BEGIN
        RETURN p_km * global_Measurement.c_km_to_mile;
    END;
BEGIN
    dbms_output.put_line(get_miles_from_km(50));
END;