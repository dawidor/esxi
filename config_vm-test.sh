#!/bin/bash

set -e

NAME=$1
ID=$2
GROUP=$3
ENV=$4

ASCII=$(printf %x $ID)

MAC="00:22:FF:02:00:$ASCII"
IP="192.168.1.$ID"

stty -echo
printf "Password to $IP: "
read PASSWORD2
stty echo
printf "\n"

sh ./docker.sh $PASSWORD2 $IP
sh ./rancher-register.sh $PASSWORD2 $NAME $IP $GROUP $ENV
