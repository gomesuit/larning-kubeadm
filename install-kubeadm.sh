#!/bin/sh

ln -s /vagrant/settings/kubernetes.repo /etc/yum.repos.d/kubernetes.repo
ln -s /vagrant/settings/k8s.conf /etc/sysctl.d/k8s.conf
setenforce 0
yum install -y --enablerepo=kubernetes docker kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet
