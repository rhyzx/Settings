# .config

My self using config/rc for vim/shell/etc…

![screenshot](https://raw.github.com/rhyzx/.config/master/screenshots/git_state_display.png)

## Installation

```sh
> cd ~
> git clone git@github.com:rhyzx/.config.git
```


## Link rc files

```sh
$ scripts/link-rc.sh
```


## Sync Vim bundles

```sh
git submodule update --init --recursive
```


## Scripts

- git-submodule-mv.sh: bat move vim-bundle's path

