# Runbook for upgrading Mastodon version

1. Test locally if custom patches won't break Ruby syntax

2. Stop all processes (under root): `systemctl stop mastodon-web mastodon-streaming mastodon-sidekiq`

3. Backup postgres

4. Follow upgrade notes and apply custom patches. Usually

    1. Check upgrade notes if there are extra steps
  
    2. Undo custom patches: `git checkout -- .`
    
    3. Switch to new version: `git pull` and `git checkout vx.x.x`
    
    4. Apply custom patches
  
    5. Install dependencies
  
    6. Run database migrations
  
    7. Precompile the assets
  
    8. Start all processes (under root): `systemctl start mastodon-web mastodon-streaming mastodon-sidekiq`
  
5. Verify!
