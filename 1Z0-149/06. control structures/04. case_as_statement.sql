DECLARE
hype NUMBER := &h;
BEGIN
    CASE
    WHEN hype >= 10 THEN
        dbms_output.put_line('That is too much hype');
    WHEN hype BETWEEN 5 AND 9 THEN
        dbms_output.put_line('That is just enough hype');
    ELSE
        dbms_output.put_line('That is not enough hype!');
    END CASE;
END;