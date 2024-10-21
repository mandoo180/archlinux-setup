#!/bin/bash

# run as root privilage

pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

if [ -z $(grep 'g14' /etc/pacman.conf) ]; then
    echo '[g14]' >> /etc/pacman.conf
    echo 'Server = https://arch.asus-linux.org' >> /etc/pacman.conf
fi

pacman -Syu

pacman -S asusctl power-profiles-daemon
systemctl enable --now power-profiles-daemon.service
pacman -S supergfxctl switcheroo-control
systemctl enable --now supergfxd
systemctl enable --now switcheroo-control
pacman -S rog-control-center
pacman -Sy linux-g14 linux-g14-headers
grub-mkconfig -o /boot/grub/grub.cfg


