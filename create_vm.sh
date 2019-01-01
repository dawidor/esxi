#!/bin/bash

NAME=$2

echo "Creating VM:"
echo "NAME=$NAME"
echo ""

ovftool --name=$NAME -ds="SSD1" --overwrite /root/base-vm-ssd2/centos7.ovf "vi://root:$1@192.168.1.198"

echo "VM created in esxi!"
echo ""
