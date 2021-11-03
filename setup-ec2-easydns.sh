#!/bin/bash
HOST=$(cat /opt/ec2-easydns/hostname)
DOMAIN=$(echo $HOST | cut -d. -f2-)

ZONE=$(aws route53 --output json list-hosted-zones | jq -r '.HostedZones[]  | select(.Name == "'$DOMAIN'.") | .Id' | cut -d/ -f3)
IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
aws route53 change-resource-record-sets --hosted-zone-id $ZONE --change-batch '{"Changes": [{"Action": "UPSERT","ResourceRecordSet": {"Name": "'$HOST'.", "Type": "A", "TTL": 300, "ResourceRecords": [{"Value": "'$IP'"}]}}]}'
