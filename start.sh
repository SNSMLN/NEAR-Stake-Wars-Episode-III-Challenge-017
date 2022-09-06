#!/bin/bash

## !!!TEST STARTUP ONELINER SCRIPT!!!
## !!!FOR AKASH!!!

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
##
service ssh restart
##
runsvdir -P /etc/service &
##
nodepid=0
##
apt update && apt upgrade -y
apt install sudo nano mc -y
##
t=1
while [[ "$t" -eq 1 ]]
do
tail -200 /var/log/neard/neard.log
date
sleep 5m
done
