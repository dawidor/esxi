#!/bin/sh
if [ $# -lt 2 ]; then
    echo "missing parameters, must have hostname macaddress "
    echo "usage: $0 Hostname macaddress"
    exit 1
fi
host=$1
mac=$2

echo "$mac" | grep -qe "^00:22:FF:"
if [ $? -ne 0 ] ; then
    echo "bad mac address - must start with VMware mandate 00:22:FF:"
    exit 2
fi

fullpath=`find /vmfs -name ${host}.vmx`
if [ ! -e "$fullpath" ]; then
    echo "no virtual machine found with name ${host}.vmx"
    exit 3
fi
curMAC=`sed -n '/ethernet0.address\s/s/^.*\s"\(.*\)"/\1/p' ${fullpath}`
#echo "fullpath is $fullpath"
if [ -n "$curMAC" ] ; then
    ### MAC already set -- Replace it?
    if [ "$curMAC" != "$mac" ] ; then
        sed "/ethernet0/s/generated/static/
             s/$curMac/$mac" ${fullpath} > /tmp/${host}.vmx
    fi
else
    sed "/ethernet0/s/generated/static/
         \$a\
         ethernet0.address = \"$mac\"
        " ${fullpath} > /tmp/${host}.vmx
fi
cp /tmp/${host}.vmx ${fullpath}
exit 0                            

