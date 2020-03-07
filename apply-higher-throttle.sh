#!/usr/bin/env bash

pushd /home/mastodon/live
git apply /home/mastodon/mastodon-issues/higher-throttle.diff
popd
