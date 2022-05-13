#!/bin/bash

# Reference from
# https://www.notion.so/0f154999939e44109a5827e6c542fb53#0fe9b77c5d0f476dafef8c666a7a715c

# Configurations
rclone_config_name=mastodon-backup
s3_bucket_name=mastodon-backup-s3.ktachibana.party

# Create backups dir
backups_dir=/home/mastodon/backups
mkdir -p "$backups_dir"

# Generate a db dump
now="$(date +"%Y_%m_%d_%I_%M_%p")"
pg_dump -Fc mastodon_production > "$backups_dir/dbbackup-$now.dump"

# Move the db backup
rclone move "$backups_dir/dbbackup-$now.dump" "$rclone_config_name:$s3_bucket_name/$now"

# Copy other important configurations
rclone copy /home/mastodon/live/.env.production "$rclone_config_name:$s3_bucket_name/$now"
    
# Remove db dump
rm -rf "$backups_dir"
