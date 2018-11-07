#!/bin/bash
sudo -s
cd /home/opc
ls -l
mv workshop_summit_schema.dmp /home/oracle
cd /home/oracle
ls -lrt
chown oracle:oinstall workshop_summit_schema.dmp



