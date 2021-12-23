DROP TABLE products;
DROP TABLE all_products;
DROP SYNONYM products;

CREATE TABLE all_products (
    product_id NUMBER,
    product_name VARCHAR2(100),
    product_category VARCHAR2(100)
);

INSERT INTO all_products VALUES (1, 'MacBook Pro 2021', 'Laptop');

COMMIT;

CREATE OR REPLACE synonym products FOR all_products;

SELECT * FROM products;

CREATE OR REPLACE VIEW v_all_products
AS
SELECT *
FROM products;

SELECT * FROM v_all_products;

CREATE OR REPLACE PROCEDURE read_from_synonym
AS
BEGIN
    FOR i IN (SELECT * FROM products)
    LOOP
        dbms_output.put_line(i.product_name || ' - ' || i.product_category);
    END LOOP;
END;

EXECUTE read_from_synonym;

CREATE OR REPLACE PROCEDURE read_from_synonym2
AS
BEGIN
    FOR i IN (SELECT product_id FROM products)
    LOOP
        dbms_output.put_line(i.product_id);
    END LOOP;
END;

EXECUTE read_from_synonym2;

SELECT object_name, object_type, status
FROM user_objects
WHERE lower(object_name) IN ('products', 'all_products', 'read_from_synonym', 'read_from_synonym2', 'v_all_products');

CREATE OR REPLACE SYNONYM products FOR employees;

SELECT object_name, object_type, status
FROM user_objects
WHERE lower(object_name) IN ('products', 'all_products', 'read_from_synonym', 'read_from_synonym2', 'v_all_products');