#!/usr/bin/env bash
set -e

sudo systemctl restart mastodon-web mastodon-sidekiq mastodon-streaming
