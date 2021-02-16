Please file issues about [my Mastodon instance, mastodon.ktachibana.party](https://mastodon.ktachibana.party) here as GitHub issues

## Run development Mastodon on macOS

1. Install Node.js 12 (recommends `asdf` with `lts-Erbium` or `nvm`), ruby 2.7 (recommends `asdf`), yarn and Postgres

2. Install native dependencies
```
brew install protobuf libidn imagemagick
```

3. Install code dependencies
```
gem install bundler --no-document
bundle install -j$(getconf _NPROCESSORS_ONLN)
yarn install --pure-lockfile
```

4. Migrate database (once)
```
RAILS_ENV=development bundle exec rails db:setup
```

5. Install [`node-foreman`](https://github.com/strongloop/node-foreman)

6. Start Mastodon
```
RAILS_ENV=development nf start
```

7. Go to [`localhost:5000`](http://localhost:5000), use username `admin@localhost:3000` and password `mastodonadmin`

## Develop a new feature
```
# In Mastodon path
git checkout -- .  # reset code state
# Changde code and test
# generate the feature diff and put it into code-patches
git diff > ~/Downloads/xyz.diff
# for changes that involve creating new files
git add the-files
git diff --staged > ~/Downloads/xyz.diff
```

## Production upgrade runbook

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
    git checkout -- .
    ```

    3. Switch to new version

    ```
    git pull
    git checkout vx.x.x
    ```

    4. Apply code patches (**DO NOT use the -restart script**)

    5. Install dependencies

    6. Run database migrations

        * Use a different connection string to avoid pgBouncer, see https://docs.joinmastodon.org/admin/scaling/#pgbouncer (You cannot use pgBouncer to perform...)

    7. Precompile the assets

    8. Start all processes

    ```
    sudo systemctl start mastodon-web mastodon-streaming mastodon-sidekiq
    ```

5. Verify
