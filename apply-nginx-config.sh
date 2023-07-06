#!/usr/bin/env bash
set -e

sudo cp ./assets/nginx.conf /etc/nginx/sites-available/mastodon
sudo cp ./assets/files.nginx.conf /etc/nginx/sites-available/files
sudo ln -s /etc/nginx/sites-available/files /etc/nginx/sites-enabled/

echo "Checking nginx syntax..."
sudo nginx -t

echo "Reloading nginx..."
sudo systemctl reload nginx

echo "Successfully applied nginx config and restarted!"
