#!/usr/bin/env bash
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

CURRENT_PWD=$(pwd)

if [ ! -f /etc/nginx/sites-available/mastodon.init ]; then
  echo "mastodon.init doesn't exist, creating one"
  cp /etc/nginx/sites-available/mastodon /etc/nginx/sites-available/mastodon.init
fi

cp /etc/nginx/sites-available/mastodon.init /etc/nginx/sites-available/mastodon
patch -N -r- /etc/nginx/sites-available/mastodon nginx.patch || echo "this is idempotent"

nginx -t
systemctl reload nginx