#!/bin/bash

NAME=$2
IP=$3
GROUP=$4
ENV=$5

CMD="sudo docker run -e CATTLE_HOST_LABELS='name=$NAME&group=$GROUP&env=$ENV'  --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.11 http://192.168.1.160/v1/scripts/E80C2AE4DC483F8540A6:1546214400000:0919aNSDOBM6oOF99SKfmeA9pc"

echo "Register to rencher:"
echo "IP=$IP"
echo ""



sshpass -p $1 ssh root@$IP $CMD

echo "Registered to rencher!"
echo ""
