#!/usr/bin/env bash
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

patch -N -r- /etc/nginx/sites-available/mastodon nginx.patch || echo "this is idempotent"

nginx -t
systemctl reload nginx