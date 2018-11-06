#!/bin/bash
sudo su –
cd /home/opc
ls -l
mv workshop_summit_schema.dmp /home/oracle
cd /home/oracle
ls -lrt
chown oracle:oracle workshop_summit_schema.dmp



