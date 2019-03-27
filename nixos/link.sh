#!/bin/sh
sudo rm -r /etc/nixos/configuration.nix
sudo ln $(pwd)/configuration.nix /etc/nixos/configuration.nix

sudo rm -r /etc/nixos/python.nix
sudo ln $(pwd)/configuration.nix /etc/nixos/configuration.nix
