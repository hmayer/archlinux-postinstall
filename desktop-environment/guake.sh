#!/bin/bash
#
# Install Guake
#

CURRENTDIR=$(dirname $(readlink -f $0))
GSETTINGS=/usr/bin/gsettings

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

# Installing guake package
arch-install guake

# Set F12 as dropdown key in GNOME global shorcut (needed in wayland environment)
${GSETTINGS} set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
${GSETTINGS} set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'dropdown-guake'"
${GSETTINGS} set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'F12'"
${GSETTINGS} set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'/usr/bin/guake -t'"

# Set autostart
cat > ${HOME}/.config/autostart/guake.desktop <<EOF
[Desktop Entry]
Name=Guake Terminal
Comment=Use the command line in a Quake-like terminal
TryExec=guake
Exec=guake
Icon=guake
Type=Application
Categories=GNOME;GTK;System;Utility;TerminalEmulator;
StartupNotify=true
X-Desktop-File-Install-Version=0.22
X-GNOME-Autostart-enabled=true
Hidden=false
NoDisplay=false
EOF
