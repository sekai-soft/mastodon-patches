#!/usr/bin/env bash
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

if grep -Fxq "net.core.default_qdisc=fq" /etc/sysctl.conf
then
    echo "net.core.default_qdisc=fq exists"
else
    echo -e "net.core.default_qdisc=fq" >> /etc/sysctl.conf
fi

if grep -Fxq "net.ipv4.tcp_congestion_control=bbr" /etc/sysctl.conf
then
    echo "net.ipv4.tcp_congestion_control=bbr exists"
else
    echo -e "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
fi
