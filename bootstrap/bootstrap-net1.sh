#!/usr/bin/env bash

echo $USER
echo '===== Configuring Root Password ====='
echo "ansible.123\nansible.123" | passwd root

# install required packages
echo '===== Installing Required Packages ====='
yum install epel-release -y && yum update -y && yum install vim wget ansible python-pip net-tools -y

# teleport tower
echo '===== Reach out and touch someone ====='
wget https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
tar xvf ansible-tower-setup-latest.tar.gz

# config ssh for root login
echo '===== Configuring SSH ====='
sed 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config > /tmp/temp.txt
sed 's/PasswordAuthentication no/PasswordAuthentication yes/' /tmp/temp.txt > /tmp/tmp.txt
mv -f /tmp/tmp.txt /etc/ssh/sshd_config
ssh-keygen -f id_rsa -t rsa -N ''
systemctl restart sshd

# config host files for internal network
echo '===== Configuring Host File ====='
cat >> /etc/hosts

# lab environment hosts
10.0.20.101 vyos-net1
10.10.10.2 vyos-c1
172.16.20.100 vyos-net2-1
172.16.30.100 vyos-net-2-2
192.168.10.100 net2


