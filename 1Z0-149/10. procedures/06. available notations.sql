DROP TABLE products;

CREATE TABLE products (
    prod_id NUMBER,
    prod_name VARCHAR2(20),
    prod_type VARCHAR2(20),
    CONSTRAINT products_pk PRIMARY KEY (prod_id)
);

CREATE OR REPLACE PROCEDURE add_products
(p_prod_id NUMBER, p_prod_name VARCHAR2 := 'Unknown', p_prod_type VARCHAR2 DEFAULT 'HW')
IS

BEGIN
    INSERT INTO products
    ( prod_id, prod_name, prod_type )
    VALUES
    (p_prod_id, p_prod_name, p_prod_type);
    
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(SQLCODE);
            dbms_output.put_line(SQLERRM);
END;

BEGIN
    add_products(p_prod_id => 1, p_prod_name => 'Cookies');
END;

