#!/bin/bash

NAME=$1
IP=$2
MAC=$3

echo "Adding entry to DHCP:"
echo "VM NAME=$NAME"
echo "VM MAC=$MAC"
echo "VM IP=$IP"
echo ""

cat <<EOT >> /etc/dhcp/dhcpd.conf
host $NAME {
  hardware ethernet $MAC;
  fixed-address $IP;
  option host-name "$NAME.spiderclub.local";
}
EOT

systemctl restart dhcpd

echo "DHCP DONE!"
echo ""
