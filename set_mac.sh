#!/bin/bash

NAME=$2
MAC=$3

echo "MAC update:"
echo "NAME=$NAME"
echo "MAC=$MAC"

sshpass -p $1 ssh root@192.168.1.198 /store/scripts/setMac.sh $NAME $MAC 

echo "MAC updated!"
echo ""
