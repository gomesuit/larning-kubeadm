#!/bin/sh
set -ex

# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/

kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10 --pod-network-cidr 10.244.0.0/16 --token 70yt8u.1mn1tm9o2x13uxhs
# kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10 --pod-network-cidr 10.244.0.0/16 --kubernetes-version 1.7.7

JOIN_TOKEN=70yt8u.1mn1tm9o2x13uxhs

echo $JOIN_TOKEN

mkdir -p ~/.kube
cp /etc/kubernetes/admin.conf ~/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
# kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
