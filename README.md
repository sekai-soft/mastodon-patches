Please file issues about [my Mastodon instance, mastodon.ktachibana.party](https://mastodon.ktachibana.party) here as GitHub issues

## Develop Mastodon on macOS

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

3. Migrate database (once)

```
RAILS_ENV=development bundle exec rails db:setup
```

4. Install [`node-foreman`](https://github.com/strongloop/node-foreman)

5. Start Mastodon

```
RAILS_ENV=development nf start
```

6. Go to [`localhost:5000`](localhost:5000), use username `admin@localhost:3000` and password `mastodonadmin`
