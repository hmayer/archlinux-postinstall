#!/bin/bash
#
# Install GNOME Notes
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install gnome-notes

