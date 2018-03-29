#!/bin/sh
rm -r ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config/nvim

rm -r ~/.config/terminator
ln -sf $(pwd)/terminator ~/.config/terminator

rm ~/.zshrc ~/.zpreztorc
ln -sf $(pwd)/zsh/zshrc ~/.zshrc
ln -sf $(pwd)/zsh/zpreztorc ~/.zpreztorc
