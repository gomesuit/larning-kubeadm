#!/bin/sh
set -ex

# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/

sudo kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10 --pod-network-cidr 10.244.0.0/16
# sudo kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10 --pod-network-cidr 10.244.0.0/16 --kubernetes-version 1.9.0

sudo mkdir -p /root/.kube
sudo cp /etc/kubernetes/admin.conf /root/.kube/config

sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
# sudo kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
