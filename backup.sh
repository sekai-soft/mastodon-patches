#!/bin/bash

# Reference from
# https://www.notion.so/0f154999939e44109a5827e6c542fb53#0fe9b77c5d0f476dafef8c666a7a715c

backups_dir=/home/mastodon/backups

# Configurations
rclone_config_name=mastodon-backup
s3_bucket_name=mastodon-backup-s3.ktachibana.party
backup_folder_name="$(date +"%Y_%m_%d_%I_%M_%p")"

# Clean up old db dump
mkdir -p "$backups_dir"
rm "$backups_dir/dbbackup-*"

# Generate a db dump
su - mastodon -c "cd $backups_dir && pg_dump -Fc mastodon_production > dbbackup-$(date +"%Y_%m_%d_%I_%M_%p").dump"

# Move the db backup
rclone move "$backups_dir/dbbackup-*" "$rclone_config_name:$s3_bucket_name/$backup_folder_name"

# Copy other important configurations
rclone copy /home/mastodon/live/.env.production "$rclone_config_name:$s3_bucket_name/$backup_folder_name"
    
# Remove db dump
rm "$backups_dir/dbbackup-*"
