#!/bin/bash

function clean_and_symlink() {
    SOURCE=$1
    TARGET=$2

    if test -e "$TARGET"; then
	echo File $TARGET already exists.
        rm -r $TARGET && echo Removed $TARGET succesfully.
    fi

    ln -sf $SOURCE $TARGET && echo Created symlink from $SOURCE to $TARGET.
}

function fish_config() {
    echo ""
    echo Configuring fish...
    # Create symlink for fish config.
    clean_and_symlink $(pwd)/fish ~/.config/fish
}

function alacritty_config() {
    echo ""
    echo Configuring alacritty...
    # Create symlink for alacritty config.
    clean_and_symlink $(pwd)/alacritty ~/.config/alacritty
    # Symlink the local xterm binary to alacritty so gnome can open terminal
    # applications using alacritty.
    clean_and_symlink /usr/bin/alacritty ~/.local/bin/xterm
}

function nvim_config() {
    echo ""
    echo Configuring nvim...
    # Create symlink for neovim.
    clean_and_symlink $(pwd)/nvim ~/.config/nvim
    # Install packer.nvim.
    if [ ! -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
        echo Packer.nvim is missing.
        git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim && echo Cloned packer.nvim succesfully.
    fi
}

function tmux_config() {
    echo ""
    echo Configuring tmux...
    clean_and_symlink $(pwd)/tmux/tmux.conf ~/.tmux.conf
}

function gnome_config() {
    echo ""
    echo Configuring gnome...
    # Load dconf settings into the root path.
    cat $(pwd)/gnome/dconf.ini | dconf load / && echo Loaded dconf settings succesfully.
}

fish_config
alacritty_config
nvim_config
tmux_config
gnome_config
