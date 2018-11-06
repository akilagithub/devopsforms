#!/bin/bash
chmod +x ./Jq/jq-linux64

oci compute instance launch --availability-domain=$region --compartment-id=$compartment_ocid --shape=$shape --display-name="formscloud" --image-id=$image_id  --subnet-id=$subnet_id --wait-for-state="RUNNING" --ssh-authorized-keys-file=$public_key_path

export INSTANCEID=$( oci compute instance list  --compartment-id=$compartment_ocid --query "data[?\"display-name\"=='formscloud'].{Id:id}" | ./Jq/jq-linux64 .[0].Id)
INSTANCEID=${INSTANCEID#'"'}
INSTANCEID=${INSTANCEID::-1}
echo "INSTANCEID = $INSTANCEID"

export INSTANCEIP=$(  oci compute instance list-vnics --instance-id=$INSTANCEID | ./Jq/jq-linux64  .data[0].\"public-ip\")
INSTANCEIP=${INSTANCEIP#'"'}
INSTANCEIP=${INSTANCEIP::-1}
echo "INSTANCEID = $INSTANCEIP"

wget https://objectstorage.us-ashburn-1.oraclecloud.com/n/gse00014392/b/FormsBucket/o/workshop_summit_schema.dmp

scp -i ./SshKeys/DbKeys/id_rsa workshop_summit_schema.dmp opc@$db_ip_address:/home/opc/.


