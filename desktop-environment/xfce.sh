#!/bin/bash
#
# Install and configure XFCE4 Desktop Environment
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install xorg
arch-install pkg-config
arch-install xfce4
arch-install ttf-ubuntu-font-family
arch-install ttf-meslo-nerd-font-powerlevel10k
arch-install nordic-darker-theme
arch-install nordic-wallpapers
arch-install elementary-xfce-icons

# Setting fonts
xfconf-query -c xsettings -p /Gtk/FontName -s "Ubuntu 10"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "MesloLGS NF 12"

# Setting themes
xfconf-query -c xsettings -p /Net/ThemeName -s "Nordic-darker"
xfconf-query -c xfwm4 -p /general/theme -s "Nordic-darker"
xfconf-query -c xsettings -p /Net/IconThemeName -s "elementary-xfce-darkest"

# Setting wallpapers
SCREENS=$(xfconf-query -c xfce4-desktop -l | grep last-image)
WALLPAPER="/usr/share/backgrounds/nordic-wallpapers/ign_venom.jpg"
for SCREEN in ${SCREENS};
do
	xfconf-query -c xfce4-desktop -p ${SCREEN} -s ${WALLPAPER}
done

# Setting Keyboard Layout to BR ABNT2
xfconf-query -c keyboard-layout -p /Default/XkbDisable -s "false"
xfconf-query -c keyboard-layout -p /Default/XkbLayout -s "br"

# Removing second panel
xfconf-query -c xfce4-panel -p /panels -t int -s 1 -a
xfce4-panel -r

