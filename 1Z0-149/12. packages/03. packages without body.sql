CREATE OR REPLACE PACKAGE global_Measurement
IS
    c_mile_to_km CONSTANT NUMBER := 1.6093;
    c_km_to_mile CONSTANT NUMBER := 1 / c_mile_to_km;
END;

DECLARE
    v_num NUMBER;
BEGIN
    v_num := global_Measurement.c_km_to_mile;
    dbms_output.put_line(v_num);
END;