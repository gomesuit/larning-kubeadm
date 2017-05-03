#!/bin/sh

ln -s /vagrant/settings/kubernetes.repo /etc/yum.repos.d/kubernetes.repo
yum install -y kubeadm
systemctl enable kubelet
setenforce 0

