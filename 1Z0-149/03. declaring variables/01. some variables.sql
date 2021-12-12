-- Starting with 12c release 2, most identifiers can be 128 bytes now (before
-- it was 30 letters)
-- can contain special characters $, _, #
DECLARE
my_fancy_and_very_long$variable#withspecialchars number;
BEGIN
my_fancy_and_very_long$variable#withspecialchars := 42;
my_fancy_and_very_long$variable#withspecialchars := my_fancy_and_very_long$variable#withspecialchars + 5;
dbms_output.put_line(my_fancy_and_very_long$variable#withspecialchars);
END;