#!/bin/sh
set -ex

ln -sf /vagrant/settings/kubernetes.repo /etc/yum.repos.d/kubernetes.repo
ln -sf /vagrant/settings/k8s.conf /etc/sysctl.d/k8s.conf
setenforce 0
yum install -y --enablerepo=kubernetes docker kubelet kubeadm kubectl kubernetes-cni

echo 'Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"' >> /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet
