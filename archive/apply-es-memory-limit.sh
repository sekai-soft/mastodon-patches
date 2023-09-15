#!/usr/bin/env bash
set -e

sudo cp ./assets/mem.options /etc/elasticsearch/jvm.options.d
sudo systemctl restart elasticsearch
