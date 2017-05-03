#!/bin/sh

ln -s /vagrant/settings/kubernetes.repo /etc/yum.repos.d/kubernetes.repo
setenforce 0
yum install -y docker kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet

