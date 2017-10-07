#!/bin/sh
set -ex

echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10 --pod-network-cidr 10.244.0.0/16
#kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10
JOIN_TOKEN=$(kubeadm token list | grep 'default' | awk '{print $1}')

echo $JOIN_TOKEN
echo $JOIN_TOKEN > /vagrant/.token

# kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f /vagrant/settings/weave-daemonset-k8s-1.6.yaml
kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f /vagrant/settings/kube-flannel-rbac.yml
kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f /vagrant/settings/kube-flannel.yml
