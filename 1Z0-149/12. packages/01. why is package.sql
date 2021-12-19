-- Some justifications

CREATE OR REPLACE FUNCTION rectangle_area
(p_width NUMBER, p_height NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN p_width * p_height;
END;

CREATE OR REPLACE FUNCTION square_area
(p_side_width NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN rectangle_area(p_side_width, p_side_width);
END;


CREATE OR REPLACE PACKAGE area
IS

FUNCTION rectangle(p_width NUMBER, p_height NUMBER)
RETURN NUMBER;

FUNCTION square(p_side_width NUMBER)
RETURN NUMBER;

END;

CREATE OR REPLACE PACKAGE BODY area
IS
    FUNCTION rectangle
    (p_width NUMBER, p_height NUMBER)
    RETURN NUMBER
    IS
    BEGIN
        RETURN p_width * p_height;
    END;
    
    FUNCTION square
    (p_side_width NUMBER)
    RETURN NUMBER
    IS
    BEGIN
        RETURN rectangle(p_side_width, p_side_width);
    END;
    
BEGIN
    dbms_output.put_line('Package being initialized');
END;

SELECT area.square(5) FROM dual;