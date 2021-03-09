#!/bin/bash

PKGS=$(cat $(pwd)/packages/common)

if test -z "$1"; then
    echo Missing platform argument.
    exit 1
elif test "$1" = "amd"; then
    PKGS+=$'\n'
    PKGS+=$(cat $(pwd)/packages/amd)
elif test "$1" = "intel"; then
    PKGS+=$'\n'
    PKGS+=$(cat $(pwd)/packages/intel)
else
    echo Invalid platform $1.
    exit 1
fi

sudo pacman -S $PKGS
