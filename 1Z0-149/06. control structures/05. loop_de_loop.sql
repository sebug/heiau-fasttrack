DECLARE
n NUMBER := &number_of_iterations;
x NUMBER := 0;
y NUMBER := 1;
counter NUMBER := 0;
tmp NUMBER;
BEGIN
    LOOP
        tmp := x;
        x := y;
        y := x + tmp;
        EXIT WHEN counter >= n;
        counter := counter + 1;
    END LOOP;
    dbms_output.put_line('fib(' || n || ') = ' || x);
END;