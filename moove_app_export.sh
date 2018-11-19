#!/bin/bash
sudo unzip -o ./FormsSummitExportCompil.zip
sudo mkdir -p /app/deploy/Summit
sudo cp /home/opc/FormsSummitExport/Summit/* /app/deploy/Summit
sudo chown -R oracle:oracle /app/deploy/Summit
sudo cp /home/opc/FormsSummitExport/jars/* /app/oracle/Middleware/Oracle_Home/forms/java 
sudo chown oracle:oinstall /app/oracle/Middleware/Oracle_Home/forms/java/summit.jar
sudo chown oracle:oinstall /app/oracle/Middleware/Oracle_Home/forms/java/jacob.jar
sudo chown oracle:oinstall /app/oracle/Middleware/Oracle_Home/forms/java/demo.jar
sudo chown oracle:oinstall /app/oracle/Middleware/Oracle_Home/forms/java/icons.jar




