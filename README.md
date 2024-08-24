# Dotfiles

Dotfiles to setup linux environment.

## Dependencies

To install dependencies, use the following command depending on the package manager and distribution:

### DNF (Fedora)
```
$ sudo dnf -y install git stow meson ninja-build zsh feh kitty neovim tmux libX11-devel libXft-devel libXinerama-devel fzf wget unzip
```

### Pacman (Arch) 
```
$ sudo pacman -S --noconfirm git stow meson ninja zsh feh kitty neovim tmux libx11 libxft libxinerama fzf wget unzip
```

### APT (Debian)
```
$ sudo apt -y install git stow meson ninja-build zsh feh kitty neovim tmux libx11-dev libxft-dev libxinerama-dev fzf wget unzip
```

## Zsh as default shell

Set Zsh as the default shell:

```
$ chsh -s $(which zsh)
```

## Install a nerd font

Install a nerd font, in the case of the current settings, SauceCodePro is used.

```
$ wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip
$ cd ~/.local/share/fonts
$ unzip SourceCodePro.zip
$ rm SourceCodePro.zip
$ fc-cache -fv
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

Copy the .desktop file to xsessions folder.

```
$ sudo cp ~/.dotfiles/dwm.desktop /usr/share/xsessions/
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

For tmux plugin manager (tpm), execute the following commands:

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install plugins using [the following](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installing-plugins) instructions.
