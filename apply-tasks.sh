#!/usr/bin/env bash
set -e

sudo cp ./tasks/mastodon-cleanup.timer /etc/systemd/system
sudo cp ./tasks/mastodon-cleanup.service /etc/systemd/system
sudo cp ./tasks/mastodon-open.timer /etc/systemd/system
sudo cp ./tasks/mastodon-open.service /etc/systemd/system
sudo cp ./tasks/mastodon-close.timer /etc/systemd/system
sudo cp ./tasks/mastodon-close.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable --now mastodon-cleanup.timer mastodon-open.timer mastodon-close.timer
