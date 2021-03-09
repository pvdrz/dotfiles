#!/bin/bash

if ! command -v pikaur; then
    git clone https://aur.archlinux.org/pikaur.git /tmp/pikaur
    cd /tmp/pikaur
    makepkg -fsri
fi

pikaur -S $(cat $(pwd)/packages/aur)
