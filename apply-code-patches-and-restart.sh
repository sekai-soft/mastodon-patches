#!/usr/bin/env bash
set -e

if [[ -z "${MASTODON_PATH}" ]]; then
  echo "MASTODON_PATH is undefined"
  exit 1
fi

bash apply-code-patches.sh

pushd "${MASTODON_PATH}"

echo "Recompiling assets..."
RAILS_ENV=production bundle exec rails assets:precompile

echo "Restarting Mastodon processes..."
sudo systemctl restart mastodon-web mastodon-streaming mastodon-sidekiq

popd

echo "Successfully applied code patches and restarted!"
