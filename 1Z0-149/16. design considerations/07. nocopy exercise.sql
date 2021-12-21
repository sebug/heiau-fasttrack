CREATE OR REPLACE PACKAGE nocopy_test
IS
    TYPE number_t IS TABLE OF VARCHAR2(32767) INDEX BY BINARY_INTEGER;
    PROCEDURE pass_by_value(nums IN OUT number_t);
    PROCEDURE pass_by_reference(nums IN OUT NOCOPY number_t);
    PROCEDURE init;
END;

CREATE OR REPLACE PACKAGE BODY nocopy_test
IS
    l_numbers number_t;
    c_array_size NUMBER := 1000000;
    c_it NUMBER := 20;
    
    PROCEDURE pass_by_value(nums IN OUT number_t)
    IS
        indx PLS_INTEGER;
    BEGIN
        indx := nums.count;
    END;
    
    PROCEDURE pass_by_reference(nums IN OUT NOCOPY number_t)
    IS
        indx PLS_INTEGER;
    BEGIN
        indx := nums.count;
    END;
    
    PROCEDURE init
    IS
    BEGIN
        l_numbers.delete;
        FOR i in 1..c_array_size
        LOOP
            l_numbers(i) := 's' || i;
        END LOOP;
        dbms_output.put_line('start pass by value ' || TO_CHAR(sysdate, 'hh:mi:ss'));
        FOR i IN 1..1000
        LOOP
            pass_by_value(l_numbers);
        END LOOP;
        dbms_output.put_line('stop pass by value ' || TO_CHAR(sysdate, 'hh:mi:ss'));
        dbms_output.put_line('start pass by reference ' || TO_CHAR(sysdate, 'hh:mi:ss'));
        FOR i IN 1..1000
        LOOP
            pass_by_reference(l_numbers);
        END LOOP;
        dbms_output.put_line('stop pass by reference ' || TO_CHAR(sysdate, 'hh:mi:ss'));
    END;
END;

EXECUTE nocopy_test.init;