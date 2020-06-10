#!/bin/bash
#
# Install GNOME extras packages
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

# Installing gnome-extra group package
arch-install gnome-extra 
arch-install gnome-icon-theme-extras

