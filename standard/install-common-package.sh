#!/bin/sh
set -ex

yum install -y net-tools vim git
#yum remove -y firewalld
swapoff -a
sed -i 's/.*swap/#&/g' /etc/fstab
