DROP TABLE customers;

CREATE TABLE customers (
    customer_id NUMBER,
    name VARCHAR2(100),
    birthday DATE,
    CONSTRAINT PK_customers PRIMARY KEY (customer_id)
);

CREATE OR REPLACE PACKAGE overload_proc
IS
    PROCEDURE add_cust(p_id number, p_name VARCHAR2, p_birthday DATE);
    PROCEDURE add_cust(p_id number, p_name VARCHAR2);
    PROCEDURE add_cust(p_name VARCHAR2, p_id NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY overload_proc
IS
    PROCEDURE add_cust(p_id number, p_name VARCHAR2, p_birthday DATE)
    IS
    BEGIN
        INSERT INTO customers(customer_id, name, birthday)
        VALUES (p_id, p_name, p_birthday);
        COMMIT;
    END;
    
    PROCEDURE add_cust(p_id number, p_name VARCHAR2)
    IS
    BEGIN
        INSERT INTO customers(customer_id, name)
        VALUES (p_id, p_name);
        COMMIT;
    END;
    
    PROCEDURE add_cust(p_name VARCHAR2, p_id NUMBER)
    IS
    BEGIN
        add_cust(p_id, p_name);
    END;
END;

EXECUTE overload_proc.add_cust(1, 'seb');
EXECUTE overload_proc.add_cust(2, 'ian freely', TO_DATE('1998-12-17', 'YYYY-MM-DD'));
EXECUTE overload_proc.add_cust('amanda huginkis', 3);

SELECT * FROM customers;