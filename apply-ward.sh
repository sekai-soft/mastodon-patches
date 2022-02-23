#!/usr/bin/env bash
set -e

mkdir -p $HOME/ward
cp ./ward/ward-1.8.8.jar $HOME/ward
cp ./ward/setup.ini $HOME/ward

sudo cp ./ward/ward.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable --now ward
