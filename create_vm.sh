#!/bin/bash

NAME=$4

echo "Creating VM:"
echo "NAME=$NAME"
echo ""

ovftool --name=$NAME -ds="$3" --overwrite /root/base-vm-ssd2/centos7.ovf "vi://root:$1@$2"

echo "VM created in esxi!"
echo ""
