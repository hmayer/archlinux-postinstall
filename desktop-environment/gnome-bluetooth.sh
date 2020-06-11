#!/bin/bash
#
# Install GNOME support for bluetooth
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install bluez
arch-install bluez-utils

${SUDO} systemctl enable bluetooth
${SUDO} systemctl start bluetooth
