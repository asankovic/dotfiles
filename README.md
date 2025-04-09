# Dotfiles

This repo contains the configuration to setup tools on my machines. This is using [Chezmoi](https://chezmoi.io), the dotfile manager to setup the install.

This configuration is created mainly for [Bluefin](https://projectbluefin.io/) and may be missing some things for other distributions or OSes.

## Run

```shell
export GITHUB_USERNAME=asankovic
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
