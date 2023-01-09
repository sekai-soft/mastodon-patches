#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
fi

pushd "${MASTODON_PATH}"
RAILS_ENV=production bundle exec rails assets:precompile
popd
