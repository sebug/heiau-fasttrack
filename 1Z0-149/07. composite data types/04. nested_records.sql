DECLARE

TYPE t_address IS RECORD (
    street NVARCHAR2(50),
    zip_code NVARCHAR2(10),
    city NVARCHAR2(50),
    country_iso NVARCHAR2(2)
);

TYPE t_contact IS RECORD (
    first_name employees.first_name%TYPE,
    last_name employees.last_name%TYPE
);

TYPE Participant IS RECORD (
    contact t_contact,
    address t_address
);

p Participant;
BEGIN
    p.contact.first_name := 'Seb';
    p.contact.last_name := 'G';
    p.address.street := 'somewhere';
    
    dbms_output.put_line(p.contact.first_name || ' ' || p.contact.last_name || ' ' || p.address.street);
END;