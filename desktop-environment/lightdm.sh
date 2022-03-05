#!/bin/bash
#
# Install and configure LightDM
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install lightdm
arch-install lightdm-gtk-greeter
arch-install ttf-ubuntu-font-family
arch-install nordic-darker-theme
arch-install nordic-wallpapers
arch-install elementary-xfce-icons
sudo systemctl enable lightdm

echo "
[greeter]
theme-name = Nordic-darker
icon-theme-name = elementary-xfce-darkest
font-name = Ubuntu 10
background = /usr/share/backgrounds/nordic-wallpapers/ign_venom.jpg
position = 63%,start 60%,start
" | sudo tee /etc/lightdm/lightdm-gtk-greeter.conf
