CREATE VIEW customers_view
AS
SELECT cust_id,
name,
status,
name || status display_name
FROM customers;

SELECT * FROM customers_view;

CREATE OR REPLACE TRIGGER insert_in_customers_instead
INSTEAD OF
INSERT
ON
customers_view
FOR EACH ROW
BEGIN
    dbms_output.put_line('Deciding to ignore ' || :new.name);
--    INSERT INTO customers (cust_id, name, status)
--    VALUES (:new.cust_id, :new.name, :new.status);
END;

INSERT INTO customers_view (cust_id, name, status, display_name)
VALUES (23, 'fromview', 'N', 'fromviewN');

SELECT * FROM customers_view;