#!/usr/bin/env bash
set -e

if [[ -z "${PG_BACKUP_ROOT}" ]]; then
  echo "PG_BACKUP_ROOT is undefined"
  exit 1
fi

DATE=`date '+%Y-%m-%d-%H-%M-%S'`
BACKUP_TAR="${DATE}.tar"

pg_dump -v -f "${PG_BACKUP_ROOT}/${BACKUP_TAR}" -F tar -h /var/run/postgresql -p 5432 -d mastodon_production -U mastodon
ls -alh "${PG_BACKUP_ROOT}"

for f in *; do
  if [ "${f}" != "${BACKUP_TAR}" ]; then
    rm ${f}
  fi
done
