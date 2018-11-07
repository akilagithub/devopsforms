#!/bin/bash
ORACLE_SID=aTFdb
ORAENV_ASK=NO
. oraenv
imp system/BEstrO0ng_#11@129.213.163.108:1521/MYPDB.dbsubad2.completevcn.oraclevcn.com file=/home/oracle/workshop_summit_schema.dmp FROMUSER=SUMMIT TOUSER=SUMMIT



