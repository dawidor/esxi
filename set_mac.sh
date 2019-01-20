#!/bin/bash

NAME=$3
MAC=$4

echo "On server=$2"
echo "MAC update:"
echo "NAME=$NAME"
echo "MAC=$MAC"

sshpass -p $1 ssh root@$2 /store/scripts/setMac.sh $NAME $MAC 

echo "MAC updated!"
echo ""
