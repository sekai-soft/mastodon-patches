#!/usr/bin/env bash
set -e

if [[ -z "${SSH_USERNAME_AND_HOST}" ]]; then
  echo "SSH_USERNAME_AND_HOST is undefined"
  exit 1
fi

if [[ -z "${PG_BACKUP_ROOT}" ]]; then
  echo "PG_BACKUP_ROOT is undefined"
  exit 1
fi

ssh "${SSH_USERNAME_AND_HOST}" "su - mastodon -c 'PG_BACKUP_ROOT=${PG_BACKUP_ROOT} /home/mastodon/mastodon-issues/backup-pg.sh'"
BACKUP_FILENAME=$(ssh "${SSH_USERNAME_AND_HOST}" "ls ${PG_BACKUP_ROOT} -rt | tail -1")
scp "${SSH_USERNAME_AND_HOST}":"${PG_BACKUP_ROOT}"/"${BACKUP_FILENAME}" .
