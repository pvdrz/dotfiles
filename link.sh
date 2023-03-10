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
    echo Configuring foot...
    # Create symlink for foot config.
    clean_and_symlink $(pwd)/alacritty ~/.config/alacritty
    # Symlink the local xterm binary to foot so gnome can open terminal
    # applications using foot.
    mkdir -p ~/.local/bin
    clean_and_symlink /usr/bin/alacritty ~/.local/bin/xterm
}

function nvim_config() {
    echo ""
    echo Configuring nvim...
    # Create symlink for neovim.
    clean_and_symlink $(pwd)/nvim ~/.config/nvim
}

fish_config
nvim_config
alacritty_config
