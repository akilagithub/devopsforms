export MYRESULT=$(sql -noupdates -s -l @db_system_user/@db_systep_password@$db_ip_address:1521/$db_service_name @check_schema.sql)

echo "MYRESULT = $MYRESULT"

if [ "$MYRESULT" == "GO" ]
  sql -noupdates -s -l @db_system_user/@db_systep_password@$db_ip_address:1521/$db_service_name @create_ddl.sql
  echo "CREATE SCHEMA DONE"
else
  echo "SCHEMA ALREADY EXISTS"
fi
