create tablespace summit_tbs datafile 'summit_tbs01.dbf' size 100M autoextend on;
CREATE USER summit IDENTIFIED BY AlphA_2014_ default tablespace summit_tbs CONTAINER=CURRENT;
grant connect, resource to summit;
grant create session, grant any privilege to summit;
grant unlimited tablespace to summit;
create or replace directory pump_dir as '/home/oracle';
grant read,write on directory pump_dir to SUMMIT;
alter profile default limit PASSWORD_LIFE_TIME unlimited;