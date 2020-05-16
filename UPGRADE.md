# Runbook for upgrading Mastodon version

1. Test locally if custom patches won't break Ruby syntax

2. Stop all processes

```bash
sudo systemctl stop mastodon-web
sudo systemctl stop mastodon-streaming
sudo systemctl stop mastodon-sidekiq
```

3. Backup postgres

4. Follow upgrade notes and apply custom patches. Usually

    1. Check upgrade notes if there are extra steps
  
    2. Undo custom patches: `git checkout -- .`
    
    3. Switch to new version `git pull` and `git checkout vx.x.x`
  
    4. Install dependencies
  
    5. Run database migrations
  
    6. Precompile the assets
  
    7. Apply custom patches
  
    8. Start all processes
  
    ```bash
    sudo systemctl start mastodon-web
    sudo systemctl start mastodon-streaming
    sudo systemctl start mastodon-sidekiq
    ```
  
5. Verify!
