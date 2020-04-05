#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
fi

CURRENT_PWD=$(pwd)

pushd "${MASTODON_PATH}"

git apply -R "${CURRENT_PWD}/higher-throttle.diff" || echo "this is idempotent"
git apply "${CURRENT_PWD}/higher-throttle.diff"

git apply -R "${CURRENT_PWD}/higher-feed-count.diff" || echo "this is idempotent"
git apply "${CURRENT_PWD}/higher-feed-count.diff"

git status
git diff

popd
