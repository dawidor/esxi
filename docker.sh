#!/bin/bash

IP=$2
DATA_FOLDER="/data/docker/telegraf/etc/"
CMD="curl https://releases.rancher.com/install-docker/18.06.sh | sh; usermod -aG docker dawidor; mkdir -p $DATA_FOLDER"

echo " Install docker:"
echo "IP=$IP"
echo ""


sshpass -p $1 ssh -o "StrictHostKeyChecking no" root@$IP $CMD
sshpass -p $1 scp /root/scripts/configs/telegraf.conf root@$IP:$DATA_FOLDER 

echo "Docker installed!"
echo ""
