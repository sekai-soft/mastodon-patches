# mastodon-patches

Patches for [my Mastodon instance](https://mastodon.ktachibana.party)

## Develop for a new Mastodon version

1. Clone this repository and [my Mastodon fork](https://github.com/sekai-soft/mastodon)

2. For the mastodon fork, sync tags from upstream to fork

```
git remote add upstream https://github.com/mastodon/mastodon.git
git fetch --tags upstream
git push --tags
```

3. For the mastodon fork, checkout the tag for the version you want to publish, e.g. `git checkout v4.3.4`

4. For the mastodon fork, checkout and switch to a new branch for the version, e.g. `git switch -c kt-4.3.4`

5. Open the mastodon fork in VSCode as devcontainer

    1. Use `MASTODON_PATH=/path/to/mastodon-fork ./apply-code-patches.sh` in this repository to apply patches from previous version

    2. To update an existing feature or develop a new feature

        * Change code in the mastodon fork

        * Use `bin/dev` to start

        * Use `bundle exec rails assets:precompile` to test frontend assets

        * The web UI is located at [`http://localhost:3000`](http://localhost:3000). Use username `admin@localhost` and password `mastodonadmin`.

        * To revert all code patches in the mastodon fork, use `MASTODON_PATH=/path/to/mastodon-fork ./revert-code-patches.sh`

        * To commit the current state of the mastodon fork to a diff, use `MASTODON_PATH=/path/to/mastodon-fork ./commit-code-patch.sh`

    3. After all features have been done, commit and push all changes

        ```
        git add --all
        git commit -m "kt 4.3.4" --no-verify
        git push origin kt-4.3.4 --no-verify
        ```

## Publish the new Mastodon version

Create a new release [here](https://github.com/sekai-soft/mastodon/releases/new)

* Tag should be `vx.y.z+kt`, e.g. `v4.3.4+kt`

* Target should be the branch for the version, e.g. `kt-4.3.4`
