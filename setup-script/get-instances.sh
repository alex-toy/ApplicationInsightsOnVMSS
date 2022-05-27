#!/bin/bash

resourceGroup=$1
vmssName=$2

echo "You can now ssh into your instances :"

instances=$(az vmss list-instance-connection-info \
  --resource-group $resourceGroup \
  --name $vmssName --output tsv)

for instance in $instances
do
    IFS=':'
    read -ra newarr <<< "$instance"
    echo "ssh udacityadmin@${newarr[0]} -p ${newarr[1]}"
done 



