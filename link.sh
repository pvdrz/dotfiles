#!/bin/sh
rm -r ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config/nvim

rm -r ~/.config/fish
ln -sf $(pwd)/fish ~/.config/fish
