CREATE OR REPLACE PROCEDURE p_welcome_msg (p_name IN VARCHAR2) 
IS
BEGIN
  dbms_output.put_line ('Welcome '|| p_name);
END;
/
EXEC p_welcome_msg ('Somebody');