#!/usr/bin/env bash
set -e

sudo cp ./ward/ward.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable --now ward
