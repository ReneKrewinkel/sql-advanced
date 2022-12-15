CREATE OR REPLACE FUNCTION f_welcome_msg( p_name IN VARCHAR2) RETURN VAR.CHAR2
IS
BEGIN
 RETURN ('Welcome '|| p_name);
END;
/

DECLARE
    lv_msg VARCHAR2(250);
BEGIN
    lv_msg := f_welcome_msg('Somebody');
    dbms_output.put_line(lv_msg);
END;
/