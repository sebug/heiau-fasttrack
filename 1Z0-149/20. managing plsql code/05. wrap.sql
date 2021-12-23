-- Obfuscation - I don't wanna know ><

SELECT dbms_ddl.wrap(q'{
CREATE OR REPLACE FUNCTION get_blab
RETURN VARCHAR2
IS
    v_ret VARCHAR2(100);
BEGIN
    $IF $$nurbli = 5 $THEN
        v_ret := 'blab';
    $ELSE
        v_ret := 'bleh';
    $END
    RETURN v_ret;
END;
}') FROM dual;

EXECUTE dbms_ddl.create_wrapped('
CREATE OR REPLACE FUNCTION get_blab
RETURN VARCHAR2
IS
    v_ret VARCHAR2(100);
BEGIN
    $IF $$nurbli = 5 $THEN
        v_ret := 'blab';
    $ELSE
        v_ret := 'bleh';
    $END
    RETURN v_ret;
END;
');