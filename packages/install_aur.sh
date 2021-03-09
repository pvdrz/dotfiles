#!/bin/bash

PKGS=$(cat $(pwd)/aur)

if ! command -v pikaur; then
    git clone https://aur.archlinux.org/pikaur.git /tmp/pikaur
    cd /tmp/pikaur
    makepkg -fsri
    cd $PWD
fi

pikaur -S $PKGS
