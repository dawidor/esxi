#!/bin/bash

NAME=$1
IP=$2
ID=$3

echo "Adding DNS entry:"
echo "VM NAME=$NAME"
echo "VM IP=$IP"
echo "VM ID=$ID"
echo ""

echo "
update add $NAME.spiderclub.local 86400 A $IP

update add $ID.1.168.192.in-addr.arpa. 86400 PTR $NAME.spiderclub.local

show
send
quit" | nsupdate -k /etc/rndc.key

rndc freeze spiderclub.local


rndc reload spiderclub.local
rndc thaw spiderclub.local

echo "DNS created!"
echo ""
