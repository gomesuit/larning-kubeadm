#!/bin/sh

echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10
JOIN_TOKEN=$(kubeadm token list | grep 'default' | awk '{print $1}')

echo $JOIN_TOKEN
echo $JOIN_TOKEN > /vagrant/.token

kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://git.io/weave-kube-1.6
