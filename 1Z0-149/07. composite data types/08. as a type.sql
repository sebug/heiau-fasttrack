CREATE OR REPLACE TYPE t_tel AS TABLE OF VARCHAR2(50);

CREATE TABLE x_customers (
    cust_id NUMBER,
    cust_name VARCHAR2(100),
    tel t_tel
)
NESTED TABLE tel STORE AS t_tel_tbl;

INSERT INTO x_customers(cust_id, cust_name, tel)
VALUES (23, 'sebug', t_tel('123 345', '555 666'));

SELECT * FROM x_customers;
