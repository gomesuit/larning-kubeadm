#!/bin/sh

kubeadm init --skip-preflight-checks --apiserver-advertise-address 192.168.33.10
JOIN_TOKEN=$(kubeadm token list | grep 'default' | awk '{print $1}')

echo $JOIN_TOKEN
echo $JOIN_TOKEN > /vagrant/.token
