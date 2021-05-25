#!/bin/bash

PKGS=$(cat $(pwd)/aur)

if ! command -v paru; then
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -fsri
    cd $PWD
fi

paru -S $PKGS
