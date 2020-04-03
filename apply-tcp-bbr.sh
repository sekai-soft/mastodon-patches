#!/usr/bin/env bash
set -e

if grep -Fxq "net.core.default_qdisc=fq" /etc/sysctl.conf
then
    echo "net.core.default_qdisc=fq exists"
else
    sudo echo -e "net.core.default_qdisc=fq" >> /etc/sysctl.conf
fi

if grep -Fxq "net.ipv4.tcp_congestion_control=bbr" /etc/sysctl.conf
then
    echo "net.ipv4.tcp_congestion_control=bbr exists"
else
    sudo echo -e "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
fi
