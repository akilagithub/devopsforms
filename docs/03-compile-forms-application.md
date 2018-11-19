# Compile Forms Application

To do that we will use Developer Cloud Service because we can add Forms 12.2 to the template of the Build VM. You can do this step as you do before.

![Forms_Template](./images/Template_with_Docker.png)

So now create a new job "Compile_Forms_Application".

In the Source Control add the devopsforms.git as usual.

Then add a Unix Shell Builder like below :

```shell
source ./env-vars

#Download the app export file
wget  https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/FormsBucket/o/FormsSummitExport.zip
unzip FormsSummitExport.zip

#Compile Forms Application
cd ./FormsSummitExport/Summit
#chmod +x ./gen.sh
#./gen.sh

export ORACLE_HOME=/data/Oracle/FormBuilder_12.2.1.3.0
export TERM=vt220
export PATH=$ORACLE_HOME/instances/forms1/bin:$PATH
export FORMS_API_TK_BYPASS=TRUE
export FORMS_PATH=${FORMS_PATH}:${ORACLE_HOME}/forms:./FormsSummitExport/Summit
export FORMS_BUILDER_CLASSPATH=./FormsSummitExport/jars

echo "MYPDB=
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = $db_ip_address)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = $pdb_service_name)
    )
  )" > tnsnames.ora
cat ./tnsnames.ora

export MYDIR=$(pwd)
export TNS_ADMIN=$MYDIR

#do not mind for these 3 fmb. The goal is not to debug the old summit application...:o)
mv ORDERS.fmb ORDERS.nocompil
mv pick.fmb pick.nocompil
mv reg.fmb reg.nocompil

for i in `ls *.fmb`
do
echo Compiling Form $i ....
frmcmp_batch.sh  userid=summit/AlphA_2014_@MYPDB module=$i module_type=form compile_all=yes window_state=minimize
done 

for i in `ls *.pll`
do
echo Compiling Form $i ...
frmcmp_batch.sh userid=summit/AlphA_2014_@MYPDB module=$i module_type=library compile_all=yes window_state=minimize
done

for i in `ls *.mmb`
do
echo Compiling Form $i ....
frmcmp_batch.sh userid=summit/AlphA_2014_@MYPDB module=$i module_type=menu compile_all=yes window_state=minimize
done

cd ../..
zip -r FormsSummitExportCompil.zip ./FormsSummitExport

chmod +x ./upload_app_export.sh
chmod +x ./moove_app_export.sh
./upload_app_export.sh
```

Run the job. Look at the result. You can connect sith ssh to the Forms Cloud VM in order to check that all is good. 