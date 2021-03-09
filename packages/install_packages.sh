#!/bin/bash

PKGS=$(cat $(pwd)/common)

if test -z "$1"; then
    echo Missing platform argument.
    exit 1
elif test "$1" = "amd"; then
    PKGS+=$'\n'
    PKGS+=$(cat $(pwd)/amd)
elif test "$1" = "intel"; then
    PKGS+=$'\n'
    PKGS+=$(cat $(pwd)/intel)
else
    echo Invalid platform $1.
    exit 1
fi

sudo pacman -S $PKGS
