CREATE OR REPLACE PROCEDURE pass_by_ref
(p_id NUMBER)
IS
BEGIN
    -- p_id := 24; -- kann nicht als Zuweisungsziel verwendet werden
    dbms_output.put_line(p_id);
END;

EXECUTE pass_by_ref(23);

CREATE OR REPLACE PROCEDURE pass_by_value
(p_id IN OUT NUMBER)
IS
BEGIN
    p_id := p_id * 10;
    IF p_id > 100 THEN
        RAISE VALUE_ERROR;
    END IF;
END;

DECLARE
v NUMBER := 50;
BEGIN
    pass_by_value(v);
    EXCEPTION
        WHEN VALUE_ERROR THEN
            dbms_output.put_line('Value error, the value of v is currently ' || v);
END;

CREATE OR REPLACE PROCEDURE pass_by_reference
(p_id IN OUT NOCOPY NUMBER)
IS
BEGIN
    p_id := p_id * 10;
    IF p_id > 100 THEN
        RAISE VALUE_ERROR;
    END IF;
END;

DECLARE
v NUMBER := 50;
BEGIN
    pass_by_reference(v);
    EXCEPTION
        WHEN VALUE_ERROR THEN
            dbms_output.put_line('Value error, the value of v is currently ' || v);
END;