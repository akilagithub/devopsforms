set serveroutput on;
alter session set container = MYPDB;
DECLARE
    cnt NUMBER;
BEGIN
    SELECT Count(*)
    INTO   cnt
    FROM   all_users
    WHERE  USERNAME = 'SUMMIT';

    IF cnt = 1 THEN
        dbms_output.put_line('NOGO');   
    ELSE
		dbms_output.put_line('GO');   
    END IF;
END;
/


