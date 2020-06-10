#!/bin/bash
#
# Install GNOME desktop environment
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

# Installing gnome group package
arch-install gnome
${SUDO} systemctl enable gdm

#arch-install gnome-extra 
