# Dotfiles

This repository contains my personal configuration setup for provisioning tools and settings across my machines using [chezmoi](https://chezmoi.io), a dotfiles manager.

While this setup is primarily tailored for [Bluefin Linux](https://projectbluefin.io/), it may require adjustments or additional components to work seamlessly on other distributions or operating systems.


## Run

```shell
export GITHUB_USERNAME=asankovic
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
