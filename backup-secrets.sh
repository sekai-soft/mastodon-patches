#!/usr/bin/env bash
set -e

if [[ -z "${SECRETS_BACKUP_ROOT}" ]]; then
  echo "SECRETS_BACKUP_ROOT is undefined"
  exit 1
fi

DATE=`date '+%Y-%m-%d-%H-%M-%S'`

tar cf "${SECRETS_BACKUP_ROOT}/${DATE}.tar" /home/mastodon/live/.env.production
ls -alh "${SECRETS_BACKUP_ROOT}"
