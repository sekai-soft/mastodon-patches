#!/usr/bin/env bash
set -e

RAILS_ENV=production /home/mastodon/live/bin/tootctl media remove --days 7
