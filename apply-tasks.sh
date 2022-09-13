#!/usr/bin/env bash
set -e

sudo cp ./tasks/mastodon-cleanup.timer /etc/systemd/system
sudo cp ./tasks/mastodon-cleanup.service /etc/systemd/system
sudo cp ./tasks/mastodon-backup.timer /etc/systemd/system
sudo cp ./tasks/mastodon-backup.service /etc/systemd/system
sudo cp ./tasks/es-healthcheck.timer /etc/systemd/system
sudo cp ./tasks/es-healthcheck.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable --now mastodon-cleanup.timer mastodon-backup.timer es-healthcheck.timer
