#!/bin/bash

set -e

SERVER_IP="192.168.1.199"

DATASTORE="datastore1"

NAME=$1
ID=$2
GROUP=$3
ENV=$4

ASCII=$(printf %x $ID)

MAC="00:22:FF:01:00:$ASCII"
IP="192.168.1.$ID"

stty -echo
printf "Password: "
read PASSWORD
stty echo
printf "\n"

sh ./create_vm.sh $PASSWORD $SERVER_IP $DATASTORE $NAME
sh ./set_mac.sh $PASSWORD $SERVER_IP $NAME $MAC
sh ./start_vm.sh $PASSWORD $SERVER_IP $NAME

echo "Sleep for 20secs for vm to start"
sleep 20

sh ./add_dhcp.sh $NAME $IP $MAC
sh ./add_dns.sh $NAME $IP $ID

# stty -echo
# printf "Password to $IP: "
# read PASSWORD2
# stty echo
# printf "\n"

# sh ./docker.sh $PASSWORD2 $IP
# sh ./rancher-register.sh $PASSWORD2 $NAME $IP $GROUP $ENV

