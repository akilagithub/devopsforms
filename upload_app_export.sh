#!/bin/bash

#Update permissions of the key for ssh
chmod 400 ./SshKeys/formr.ssh

#Get Forms VM IP Address
export INSTANCEIP=$(cat /tmp/outputINSTANCEIP.txt)
echo "INSTANCEIP = $INSTANCEIP"

#Upload the app export file to the Forms App VM
scp -o StrictHostKeyChecking=no -i ./SshKeys/formr.ssh FormsSummitExportCompil.zip opc@$INSTANCEIP:/home/opc/.

#Moove the app export on /home/oracle
ssh -i ./SshKeys/formr.ssh opc@$INSTANCEIP 'bash -s' < moove_app_export.sh


