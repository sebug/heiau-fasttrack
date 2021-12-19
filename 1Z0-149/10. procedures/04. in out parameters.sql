CREATE OR REPLACE PROCEDURE format_tel
(p_tel IN OUT VARCHAR2)
IS

BEGIN
    p_tel := SUBSTR(p_tel, 1, 3) || '(' ||
        SUBSTR(p_tel, 4, 2) || ')' || SUBSTR(p_tel, 6);
END;
