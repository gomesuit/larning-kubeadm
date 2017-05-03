#!/bin/sh

curl -fsSL https://get.docker.com/ | sh

# yum list --showduplicates | grep docker
yum downgrade -y docker-engine-1.12.6-1.el7.centos
yum downgrade -y docker-engine-selinux-1.12.6-1.el7.centos

systemctl enable docker
systemctl start docker

usermod -a -G docker vagrant

