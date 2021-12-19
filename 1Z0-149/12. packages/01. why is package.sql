-- Some justifications

CREATE OR REPLACE FUNCTION rectangle_area
(p_side_1 NUMBER, p_side_2 NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN p_side_1 * p_side_2;
END;

CREATE OR REPLACE FUNCTION square_area
(p_side_width NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN rectangle_area(p_side_width, p_side_width);
END;


SELECT square_area(3) FROM dual;