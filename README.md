# Dotfiles

Dotfiles to setup linux environment.

## Dependencies

To install dependencies, use the following command depending on the package manager and distribution:

### DNF (Fedora)
```
$ sudo dnf -y install git stow meson ninja-build zsh feh kitty neovim picom tmux
```

### Pacman (Arch) 
```
$ sudo pacman -S --noconfirm git stow meson ninja zsh feh kitty neovim picom tmux
```

### APT (Debian)
```
$ sudo apt -y install git stow meson ninja-build zsh feh kitty neovim picom tmux
```

## Zsh as default shell

Set Zsh as the default shell:

```
$ chsh -s $(which zsh)
```

## Installation

First, clone this repository inside $HOME directory.

```
$ git clone git@github.com:ericgarzagzz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Then, in order to build dwm, execute the following commands: 

```
$ cd ~/.dotfiles/dwm
$ rm config.h
$ sudo make install
```

For the dwm status bar to show stats, build dwmblocks by executing:

```
$ cd ~/.dotfiles/dwmblocks
$ rm ~/.dotfiles/dwmblocks/blocks.h
$ sudo make install
```

After that, build the script source files under .local/bin/dwmscripts

```
$ cd ~/.dotfiles/.local/bin/dwmscripts
$ meson setup build
$ cd build
$ ninja
```

Finally, navigate back to repository root directory and use GNU stow to create symlinks for you.

```
$ cd ~/.dotfiles
$ stow .
```

If any of the config files are already on the system, use --adapt flag on stow, so that stow deletes the files and create the symlinks.

```
$ stow --adopt .
```
