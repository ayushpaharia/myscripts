#!bin/bash
cat /dev/null > /etc/resolv.conf
echo "nameserver 1.1.1.1
nameserver 1.0.0.1" > /etc/resolv.conf
