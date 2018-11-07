set serverout on;
alter session set container = MYPDB;
DECLARE
    cnt NUMBER;
BEGIN
    SELECT Count(*)
    INTO   cnt
    FROM   all_users
    WHERE  USERNAME = 'SUMMIT';

    IF cnt = 1 THEN
	    --@delete_ddl.sql;
	
        dbms_output.put_line('User SUMMIT Already Exists');   
    ELSE
		@create_ddl.sql
		
		dbms_output.put_line('User SUMMIT Is There');   
    END IF;
END;
/


