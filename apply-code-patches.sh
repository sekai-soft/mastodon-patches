#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
fi

CURRENT_PWD=$(pwd)

pushd "${MASTODON_PATH}"
git checkout -- .
git clean -fd -e .tool-versions
for filename in "${CURRENT_PWD}"/code-patches/*.diff; do
  echo Applying "${filename}" ...
  git apply "${filename}"
done
git status
popd
