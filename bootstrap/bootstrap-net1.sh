#!/usr/bin/env bash

# install required packages
yum install epel-release -y
yum update -y
yum install vim wget ansible python-pip net-tools -y

# teleport tower
wget https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
tar xvf ansible-tower-setup-latest.tar.gz

# config ssh for root login
sed 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config > /tmp/temp.txt
sed 's/PasswordAuthentication no/PasswordAuthentication yes/' /tmp/temp.txt > /tmp/tmp.txt
mv -f /tmp/tmp.txt /etc/ssh/sshd_config
ssh-keygen -f id_rsa -t rsa -N ''
systemctl restart sshd


