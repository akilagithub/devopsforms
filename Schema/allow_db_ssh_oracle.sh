#!/bin/bash
sudo mv /home/oracle/.ssh/authorized_keys /home/oracle/.ssh/authorized_keys.bkp
sudo cp /home/opc/.ssh/authorized_keys /home/oracle/.ssh/authorized_keys
sudo chown oracle:oinstall /home/oracle/.ssh/authorized_keys



