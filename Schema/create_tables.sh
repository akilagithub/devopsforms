echo URL=$DBUSERSUMMIT$SLACH$DBPASSWORDSUMMIT@$db_ip_address:1521/$pdb_service_name

export MYRESULT=$(sql -noupdates -s -l $DBUSERSUMMIT$SLACH$DBPASSWORDSUMMIT@$db_ip_address:1521/$pdb_service_name @check_tables.sql)

echo "MYRESULT = $MYRESULT"

if [ $MYRESULT == "NO" ]
then
  wget https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/FormsBucket/o/workshop_summit_schema.dmp
  echo "DUMP UPLOAD OK"
  
  echo "MYPDB=
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = $db_ip_address)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = $pdb_service_name)
    )
  )" > tnsnames.ora
  cat tnsnames.ora
  
  docker run -dit --name impexpcontainer cpruvost/devopsforms bash
  docker cp ./tnsnames.ora impexpcontainer:/usr/lib/oracle/18.3/client64/tnsnames.ora
  docker cp ./workshop_summit_schema.dmp impexpcontainer:workshop_summit_schema.dmp
  docker exec impexpcontainer imp $DBUSER$SLACH$DBPASSWORD@MYPDB file=./workshop_summit_schema.dmp FROMUSER=SUMMIT TOUSER=SUMMIT
  docker stop impexpcontainer
  docker rm impexpcontainer
  
  echo "CREATE TABLES DONE"
else
  echo "TABLES ALREADY EXIST"
fi
