BEGIN
    EXECUTE IMMEDIATE '
    BEGIN
        EXECUTE IMMEDIATE ''
        BEGIN
        dbms_output.put_line(''''Hey hey'''');
        END;
        '';
    END;';
END;

ALTER PROCEDURE add_rows COMPILE;

