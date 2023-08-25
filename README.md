# mastodon-patches

Patches for [my Mastodon instance](https://mastodon.ktachibana.party)

## Develop for a new Mastodon version

1. Clone this repository and [my Mastodon fork](https://github.com/k-t-corp/mastodon)

2. For the mastodon fork, checkout the tag for the version you want to publish, e.g. `git checkout v4.1.6`

3. For the mastodon fork, checkout and switch to a new branch for the version, e.g. `git switch -c kt-4.1.6`

4. Open the mastodon fork in VSCode as devcontainer

    1. Use `MASTODON_PATH=/path/to/mastodon-fork ./apply-code-patches.sh` in this repository to apply patches from previous version

    2. To update an existing feature or develop a new feature

        * Change code in the mastodon fork

        * The web UI is located at [`http://mastodon.local`](http://mastodon.local). Use username `admin@mastodon.local` and password `mastodonadmin`.

        * To revert all code patches in the mastodon fork, use `MASTODON_PATH=/path/to/mastodon-fork ./revert-code-patches.sh`

        * To commit the current state of the mastodon fork to a diff, use `MASTODON_PATH=/path/to/mastodon-fork ./commit-code-patch.sh`

    3. After all features have been done, commit and push all changes

## Publish the new Mastodon version

Create a new release [here](https://github.com/k-t-corp/mastodon/releases/new)

* Tag should be `vx.y.z+kt`, e.g. `v4.1.6+kt`

* Target should be the branch for the version, e.g. `kt-4.1.6`
