#!/bin/bash

IP="192.168.1.141"
USER="lolo"
PASS="lolo1234"

function getValue() {
	value=$(sshpass -p $PASS ssh $USER@$IP  -p 23 "show /system1/$1" | grep DesiredSpeed | sed 's/.*=//g' | sed -e 's/[[:space:]]*$//')
	echo $value
}


v=$(getValue $1)
echo "Fan1=$v"
tt=$(date +%s)
cmd="curl -i -XPOST 'http://192.168.1.157:8086/write?db=servers' --data-binary 'fan,id=$1 value=$v $(echo $tt)000000000'"
echo $cmd
eval $cmd

