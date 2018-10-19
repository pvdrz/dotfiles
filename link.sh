#!/bin/sh
rm -r ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config/nvim

rm -r ~/.config/fish
ln -sf $(pwd)/fish ~/.config/fish

rm -r ~/.config/alacritty
ln -sf $(pwd)/alacritty/ ~/.config/alacritty

rm -r ~/.tmux.conf
ln -sf $(pwd)/tmux/tmux.conf ~/.tmux.conf
