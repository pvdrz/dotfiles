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

function foot_config() {
    echo ""
    echo Configuring foot...
    # Create symlink for foot config.
    clean_and_symlink $(pwd)/foot ~/.config/foot
    # Symlink the local xterm binary to foot so gnome can open terminal
    # applications using foot.
    clean_and_symlink /usr/bin/foot ~/.local/bin/xterm
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

function gnome_config() {
    echo ""
    echo Configuring gnome...
    # Load dconf settings into the root path.
    cat $(pwd)/gnome/dconf.ini | dconf load / && echo Loaded dconf settings succesfully.
}

fish_config
nvim_config
foot_config
