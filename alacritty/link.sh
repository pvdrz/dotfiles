#!/bin/sh
rm -r ~/.config/alacritty
ln -sf $(pwd) ~/.config/alacritty
ln -sf /usr/bin/alacritty ~/.local/bin/xterm
