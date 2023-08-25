#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
fi

read -p "Patch name: " name

CURRENT_PWD=$(pwd)

pushd "${MASTODON_PATH}"
git add -A
git diff --staged > ./code-patches/$name.diff
popd
