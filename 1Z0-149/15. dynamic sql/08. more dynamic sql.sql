BEGIN
    EXECUTE IMMEDIATE '
    BEGIN
        EXECUTE IMMEDIATE ''
        BEGIN
        dbms_output.put_line(''''I heard you like execute immediate,
        so I put an execute immediate in your execute immediate'''');
        END;
        '';
    END;';
END;

ALTER PROCEDURE add_rows COMPILE;

