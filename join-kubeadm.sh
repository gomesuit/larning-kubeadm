#!/bin/sh

if [ $# -ne 1 ]; then
  echo "usage : $0 [master ip]"
  exit 1
fi

MASTER_IP=$1
JOIN_TOKEN=$(cat /vagrant/.token)

kubeadm join --skip-preflight-checks --token "$JOIN_TOKEN" "$MASTER_IP:6443"
