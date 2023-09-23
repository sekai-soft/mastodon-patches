#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
fi

read -p "Patch name (without .diff extension): " name
rm -f ./code-patches/$name.diff
touch ./code-patches/$name.diff

CURRENT_PWD=$(pwd)

pushd "${MASTODON_PATH}"
git add -A
git diff --staged > ${CURRENT_PWD}/code-patches/$name.diff
popd
