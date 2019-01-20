#!/bin/bash

IP="192.168.1.144"
USER="lolo"
PASS="lolo1234"

function getValue() {
        value=$(sshpass -p $PASS ssh $USER@$IP  -p 22 "show system1" | grep oemhp_PresentPower | sed 's/.*=//g' | sed 's/ .*//g')
        echo $value
}


v=$(getValue)
echo "Power=$v"
tt=$(date +%s)
cmd="curl -i -XPOST 'http://192.168.1.157:8086/write?db=servers' --data-binary 'power,ip=$IP,type=current value=$v $(echo $tt)000000000'"
echo $cmd
eval $cmd


