#!/usr/bin/env bash
set -e

sudo cp ./assets/mastodon-cleanup.timer /etc/systemd/system
sudo cp ./assets/mastodon-cleanup.service /etc/systemd/system
sudo cp ./assets/mastodon-backup.timer /etc/systemd/system
sudo cp ./assets/mastodon-backup.service /etc/systemd/system
sudo cp ./assets/mastodon-es-healthcheck.timer /etc/systemd/system
sudo cp ./assets/mastodon-es-healthcheck.service /etc/systemd/system
sudo cp ./assets/reboot.timer /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable --now mastodon-cleanup.timer mastodon-backup.timer mastodon-es-healthcheck.timer reboot.timer
