#!/bin/bash

#Download the db export file
wget https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/FormsBucket/o/workshop_summit_schema.dmp

#Update permissions of the key for ssh
chmod 400 ./SshKeys/DbKeys/id_rsa

#Upload the db export file to the Db VM
scp -i ./SshKeys/DbKeys/id_rsa workshop_summit_schema.dmp opc@$db_ip_address:/home/opc/.

#Moove the db export on /home/oracle
ssh -i ./SshKeys/DbKeys/id_rsa opc@$db_ip_address 'bash -s' < moove_db_export.sh


