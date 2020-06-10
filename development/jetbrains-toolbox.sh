#!/bin/bash
#
# Install Jetbrains Toolbox
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install jetbrains-toolbox

cat > ${HOME}/.config/autostart/jetbrains-toolbox.desktop <<EOF
[Desktop Entry]
Exec=/opt/jetbrains-toolbox/jetbrains-toolbox %u
Icon=/opt/jetbrains-toolbox/jetbrains-toolbox
MimeType=x-scheme-handler/jetbrains;
Name=JetBrains Toolbox
StartupNotify=false
StartupWMClass=jetbrains-toolbox
Terminal=false
Type=Application
Version=1.0
X-GNOME-Autostart-Delay=10
X-GNOME-Autostart-enabled=true
X-KDE-autostart-after=panel
X-MATE-Autostart-Delay=10
EOF
