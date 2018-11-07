EXECUTE IMMEDIATE 'create tablespace summit_tbs datafile 'summit_tbs01.dbf' size 100M autoextend on'
EXECUTE IMMEDIATE 'CREATE USER summit IDENTIFIED BY AlphA_2014_ default tablespace summit_tbs CONTAINER=CURRENT';
EXECUTE IMMEDIATE 'grant connect, resource to summit'
EXECUTE IMMEDIATE 'grant create session, grant any privilege to summit'
EXECUTE IMMEDIATE 'grant unlimited tablespace to summit'
EXECUTE IMMEDIATE 'create or replace directory pump_dir as \'/home/oracle\''
EXECUTE IMMEDIATE 'grant read,write on directory pump_dir to SUMMIT'
EXECUTE IMMEDIATE 'alter profile default limit PASSWORD_LIFE_TIME unlimited'