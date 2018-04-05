#!/bin/sh
set -ex

# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/

kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10 --pod-network-cidr 10.244.0.0/16
# kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10 --pod-network-cidr 10.244.0.0/16 --kubernetes-version 1.7.7

JOIN_TOKEN=$(kubeadm token list | grep 'default' | awk '{print $1}')

echo $JOIN_TOKEN
echo $JOIN_TOKEN > /vagrant/.token

mkdir -p ~/.kube
cp /etc/kubernetes/admin.conf ~/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
# kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
