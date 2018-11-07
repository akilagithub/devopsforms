#!/bin/bash
chmod +x ./Jq/jq-linux64
source env-vars

#Create Forms Cloud VM
oci compute instance launch --availability-domain=$region --compartment-id=$compartment_ocid --shape=$shape --display-name="formscloud" --image-id=$image_id  --subnet-id=$subnet_id --wait-for-state="RUNNING" --ssh-authorized-keys-file=$public_key_path

#Get the Instance Id of the Cloud VM
export INSTANCEID=$(oci compute instance list  --compartment-id=$compartment_ocid --query "data[?\"display-name\"=='formscloud'].{Id:id}" | ./Jq/jq-linux64 .[0].Id)
INSTANCEID=${INSTANCEID#'"'}
INSTANCEID=${INSTANCEID::-1}
echo "INSTANCEID = $INSTANCEID"

#Get the Ip Address of the Cloud VM
export INSTANCEIP=$(  oci compute instance list-vnics --instance-id=$INSTANCEID | ./Jq/jq-linux64  .data[0].\"public-ip\")
INSTANCEIP=${INSTANCEIP#'"'}
INSTANCEIP=${INSTANCEIP::-1}
echo "INSTANCEIP = $INSTANCEIP"

rm -f /tmp/outputINSTANCEIP.txt
echo $INSTANCEIP > /tmp/outputINSTANCEIP.txt

