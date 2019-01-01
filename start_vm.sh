#!/bin/bash

NAME=$2

echo "Starting VM:"
echo "NAME=$NAME"

sshpass -p $1 ssh root@192.168.1.198 /store/scripts/startVM.sh $NAME

echo "VM was started!"
echo ""
