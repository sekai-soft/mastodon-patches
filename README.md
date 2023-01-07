# mastodon-patches

Patches for [our Mastodon instance](mastodon.ktachibana.party)

## Run a development instance locally

Follow the **Vagrant** steps under [Mastodon's README](https://github.com/mastodon/mastodon#deployment)

If running `vagrant ssh -c "cd /vagrant && foreman start"` doesn't seem to work, run `vagrant ssh -c "cd /vagrant && && bundle install && gem install foreman"` and retry

<details>
  <summary>Notice if you use Apple Silicon</summary>

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
