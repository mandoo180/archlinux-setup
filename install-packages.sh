#!/bin/bash

# essentials
sudo pacman -Syu
sudo pacman -S git vim openssh coreutils bluez bluez-utils networkmanager
sudo pacman -S `awk '{printf("%s ", $1)}' packages.txt`

# yay setup
if [ -f "$(which yay)" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd -
    yay --version
fi

# install packages from aur (arch user repository)
yay -Syu
yay -S `awk '{printf("%s ", $1)}' packages-aur.txt`

# bluetooth setup
sudo systemctl enable --now bluetooth

# zsh oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO
# nvm
# rustup
# python
# java
