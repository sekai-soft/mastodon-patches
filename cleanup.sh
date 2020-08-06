#!/usr/bin/env bash
set -e

RAILS_ENV=production /home/mastodon/live/bin/tootctl media remove --days 3
RAILS_ENV=production /home/mastodon/live/bin/tootctl media remove-orphans
RAILS_ENV=production /home/mastodon/live/bin/tootctl preview_cards remove --days 14
# RAILS_ENV=production /home/mastodon/live/bin/tootctl statuses remove --days 14
