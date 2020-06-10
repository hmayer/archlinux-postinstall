#!/bin/bash
#
# Install some GNOME extensions that i like
#

CURRENTDIR=$(dirname $(readlink -f $0))
INSTALLER=/usr/bin/gnome-shell-extension-installer

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install gnome-shell-extension-installer
#${INSTALLER} ${TOPICONS_ID} --yes --restart-shell 
