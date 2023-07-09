# mastodon-patches

Patches for [our Mastodon instance](https://mastodon.ktachibana.party)

## Run a development instance locally

Open in VSCode as devcontainer

After opening [`http://mastodon.local`](http://mastodon.local), use username `admin@mastodon.local` and password `mastodonadmin`

## Develop a new feature
```
# Change code and test
git add -A
git diff --staged > /path/to/mastodon/code-patches/xyz.diff
# To revert the change
git restore --staged . && git checkout -- . && git clean -f -d
```

## Production upgrade guide

1. In development environment, apply code patches and inspect the diff
2. Stop all processes

```
sudo systemctl stop mastodon-web mastodon-streaming mastodon-sidekiq
```

3. Backup postgres

```
pg_dump -Fc mastodon_production -f backup.dump
```

4. Follow upgrade notes and apply code patches. Usually
    1. Check upgrade notes if there are extra steps
    2. Undo code patches

    ```
    git restore --staged . && git checkout -- . && git clean -f -d
    ```

    3. Switch to new version

    ```
    git pull
    git checkout vx.x.x
    ```

    4. Apply code patches

    ```
    MASTODON_PATH=../live ./apply-code-patches.sh
    ```

    5. Install dependencies

    ```
    bundle install
    yarn install
    ```

    6. (Optional) Run database migrations
    7. Precompile the assets

    ```
    RAILS_ENV=production bundle exec rails assets:precompile
    ```

    8. Start all processes

    ```
    sudo systemctl restart mastodon-web mastodon-streaming mastodon-sidekiq
    ```
