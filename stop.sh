#!/usr/bin/env bash
set -e

sudo systemctl stop mastodon-web mastodon-sidekiq mastodon-streaming
