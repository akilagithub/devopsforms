#!/bin/bash

#Download the app export file
wget  https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/FormsBucket/o/FormsSummitExport.zip
unzip FormsSummitExport.zip

#Compile Forms Application
cd ./FormsSummitExport/Summit
chmod +x ./gen.sh
./gen.sh

#Update permissions of the key for ssh
chmod 400 ./SshKeys/formr.ssh

#Get Forms VM IP Address
export INSTANCEIP=$(cat /tmp/outputINSTANCEIP.txt)
echo "INSTANCEIP = $INSTANCEIP"

#Upload the app export file to the Forms App VM
scp -o StrictHostKeyChecking=no -i ./SshKeys/formr.ssh FormsSummitExport.zip opc@$INSTANCEIP:/home/opc/.

#Moove the app export on /home/oracle
ssh -i ./SshKeys/formr.ssh opc@$INSTANCEIP 'bash -s' < moove_app_export.sh


