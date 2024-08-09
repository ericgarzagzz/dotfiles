# Dotfiles

Dotfiles to setup linux environment.

## Requirements

The following software should be already installed on the system:

- Git
- Stow

## Installation

First, clone this repository inside $HOME directory.

```
$ git clone git@github.com:ericgarzagzz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Then, use GNU stow to create symlinks for you.

```
$ stow .
```

If any of the config files are already on the system, use --adapt flag on stow, so that stow deletes the files and create the symlinks.

```
$ stow --adopt .
```
