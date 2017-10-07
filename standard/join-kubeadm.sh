#!/bin/sh
set -ex

if [ $# -ne 1 ]; then
  echo "usage : $0 [master ip]"
  exit 1
fi

MASTER_IP=$1
JOIN_TOKEN=$(cat /vagrant/.token)

echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
kubeadm join --skip-preflight-checks --token "$JOIN_TOKEN" "$MASTER_IP:6443"
