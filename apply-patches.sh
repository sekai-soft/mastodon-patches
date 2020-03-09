#!/usr/bin/env bash
set -e

pushd /home/mastodon/live

git apply -R /home/mastodon/mastodon-issues/higher-throttle.diff || echo "this is idempotent"
git apply /home/mastodon/mastodon-issues/higher-throttle.diff

git apply -R /home/mastodon/mastodon-issues/higher-feed-count.diff || echo "this is idempotent"
git apply /home/mastodon/mastodon-issues/higher-feed-count.diff

git status
git diff

popd
