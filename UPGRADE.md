# Production upgrade

1. In development environment, apply code patches and inspect the diff

2. Stop all processes

```
sudo systemctl stop mastodon-web mastodon-streaming mastodon-sidekiq
```

3. Backup postgres

4. Follow upgrade notes and apply code patches. Usually

    1. Check upgrade notes if there are extra steps

    2. Undo code patches

    ```
    git restore --staged . && git checkout -- . && git clean -f -d    ```

    3. Switch to new version

    ```
    git pull
    git checkout vx.x.x
    ```

    4. Apply code patches (**DO NOT use the -restart script**)

    5. Install dependencies

    6. Run database migrations

    7. Precompile the assets

    8. Start all processes

    ```
    sudo systemctl start mastodon-web mastodon-streaming mastodon-sidekiq
    ```

5. Verify
