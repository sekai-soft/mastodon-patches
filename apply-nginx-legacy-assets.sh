#!/usr/bin/env bash
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

CURRENT_PWD=$(pwd)

pushd /etc/nginx/sites-available
patch -N -r- -i "${CURRENT_PWD}/nginx-legacy-assets.patch"
nginx -t
popd
