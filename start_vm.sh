#!/bin/bash

NAME=$3

echo "On server: $2"
echo "Starting VM:"
echo "NAME=$NAME"

sshpass -p $1 ssh root@$2 /store/scripts/startVM.sh $NAME

echo "VM was started!"
echo ""
