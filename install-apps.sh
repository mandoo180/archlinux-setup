#!/bin/bash

# essentials
sudo pacman -Syu
sudo pacman -S git vim openssh coreutils bluez bluez-utils networkmanager
sudo pacman -S `awk '{printf("%s ", $1)}' apps.txt`

# yay setup
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -
yay --version

# bluetooth setup
sudo systemctl enable --now bluetooth

# zsh oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO
# nvm
# rustup
# python
# java
