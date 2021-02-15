#!/usr/bin/env bash
set -e

sudo cp nginx.conf /etc/nginx/sites-available/mastodon

echo "Checking nginx syntax..."
sudo nginx -t

echo "Reloading nginx..."
sudo systemctl reload nginx

echo "Successfully applied nginx config and restarted!"
