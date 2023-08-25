#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
fi

CURRENT_PWD=$(pwd)

pushd "${MASTODON_PATH}"
git restore --staged . && git checkout -- . && git clean -f -d
popd
