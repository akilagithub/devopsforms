echo URL=$DBUSER$SLACH$DBPASSWORD@$db_ip_address:1521/$pdb_service_name

export MYRESULT=$(sql -noupdates -s -l $DBUSER$SLACH$DBPASSWORD@$db_ip_address:1521/$pdb_service_name @check_schema.sql)

echo "MYRESULT = $MYRESULT"

if [ $MYRESULT == "NO" ]
then
  echo "CREATE SCHEMA START"
  sql -noupdates -s -l @db_system_user/@db_system_password@$db_ip_address:1521/$pdb_service_name @create_ddl.sql
  echo "CREATE SCHEMA DONE"
else
  echo "SCHEMA ALREADY EXISTS"
fi
