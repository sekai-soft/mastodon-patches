Please file issues about [my Mastodon instance, mastodon.ktachibana.party](https://mastodon.ktachibana.party) here as GitHub issues

## Run a development instance locally

Follow the **Vagrant** steps under [Mastodon's README](https://github.com/mastodon/mastodon#deployment)

<details>
  <summary>Notice if you use an ARM development machine</summary>

  Remember to apply the `vagrant-aarch64.diff` file to your local Mastodon repo before doing any Vagrant steps

  `PWD=$(pwd) && cd path/to/your/local/mastodon/repo && git apply $PWD/vagrant-aarch64.diff`

</details>

After opening [`http://mastodon.local`](http://mastodon.local), use username `admin@mastodon.local` and password `mastodonadmin`

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
