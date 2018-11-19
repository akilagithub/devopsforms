SET SERVEROUTPUT ON;
SET FEEDBACK OFF;

DECLARE
    cnt NUMBER;
BEGIN
    SELECT Count(*)
    INTO   cnt
    FROM   tab;

    IF cnt = 0 THEN
        dbms_output.put_line('NO');   
    ELSE
		dbms_output.put_line('YES');   
    END IF;
END;
/
exit;


