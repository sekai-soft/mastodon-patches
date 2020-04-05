#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
else

pushd "${MASTODON_PATH}"

git apply -R /home/mastodon/mastodon-issues/higher-throttle.diff || echo "this is idempotent"
git apply /home/mastodon/mastodon-issues/higher-throttle.diff

git apply -R /home/mastodon/mastodon-issues/higher-feed-count.diff || echo "this is idempotent"
git apply /home/mastodon/mastodon-issues/higher-feed-count.diff

git status
git diff

popd
