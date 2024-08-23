#!/bin/bash

function install_dependencies() {
	DNF_CMD=$(which dnf)
	APT_CMD=$(which apt)
	PACMAN_CMD=$(which pacman)
	# Install dependencies
	if [[ -n $DNF_CMD ]]; then
		sudo dnf -y install git stow meson ninja-build zsh feh kitty neovim picom tmux libX11-devel libXft-devel libXinerama-devel fzf wget unzip
	elif [[ -n $APT_CMD ]]; then
		sudo apt -y install git stow meson ninja-build zsh feh kitty neovim picom tmux libx11-dev libxft-dev libxinerama-dev fzf wget unzip
	elif [[ -n $PACMAN_CMD ]]; then
		sudo pacman -S --noconfirm git stow meson ninja zsh feh kitty neovim picom tmux libx11 libxft libxinerama fzf wget unzip
	else
		echo "Error: No supported package manager found."
		exit 1;
	fi
}

function set_zsh_default() {
	chsh -s "$(which zsh)"
}

function install_nerd_font() {
	wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip
	cd ~/.local/share/fonts || exit 1
	unzip SourceCodePro.zip
	rm SourceCodePro.zip
	fc-cache -fv
}

function clone_dotfiles_repo() {
	# Clone dotfiles repository
	git clone https://github.com/ericgarzagzz/dotfiles.git ~/.dotfiles
	cd ~/.dotfiles || exit 1
}

function install_dwm() {
	cd ~/.dotfiles/dwm || exit 1
	rm config.h
	sudo make install
}

function install_dwmblocks() {
	cd ~/.dotfiles/dwmblocks || exit 1
	rm blocks.h
	sudo make install
}

function build_scripts() {
	cd ~/.dotfiles/.local/bin/dwmscripts || exit 1
	meson setup build
	cd build || exit 1
	ninja
}

function copy_xsessions() {
	sudo cp ~/.dotfiles/dwm.desktop /usr/share/xsessions/
}

function create_symlinks() {
	cd ~/.dotfiles || exit 1
}

function install_tpm() {
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_dependencies
set_zsh_default
install_nerd_font
clone_dotfiles_repo
install_dwm
install_dwmblocks
build_scripts
copy_xsessions
create_symlinks
install_tpm
