SET SERVEROUTPUT ON;
SET FEEDBACK OFF;

DECLARE
    cnt NUMBER;
BEGIN
    SELECT Count(*)
    INTO   cnt
    FROM   all_users
    WHERE  USERNAME = 'SUMMIT';

    IF cnt = 1 THEN
        dbms_output.put_line('YES');   
    ELSE
		dbms_output.put_line('NO');   
    END IF;
END;
/
exit;


