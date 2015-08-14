# .config

My self using config/rc for vim/shell/etc…

![git_state_display](https://cloud.githubusercontent.com/assets/1676871/9267864/064cb824-4289-11e5-8148-68e4efba896a.png)


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

