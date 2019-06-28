#!/bin/sh
rm ~/.local.fish
ln -sf $(realpath $1) ~/.local.fish
