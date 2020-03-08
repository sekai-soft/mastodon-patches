#!/usr/bin/env bash

pushd /home/mastodon/live
git apply /home/mastodon/mastodon-issues/higher-feed-count.diff
popd
