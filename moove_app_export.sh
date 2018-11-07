#!/bin/bash
sudo -s
cd /home/opc
ls -l
mv FormsSummitExport.zip /home/oracle
cd /home/oracle
ls -lrt
chown oracle:oinstall FormsSummitExport.zip
su oracle
pwd
unzip FormsSummitExport.zip




