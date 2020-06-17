#!/bin/bash
#
# Install Gimp
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install gimp
arch-install xsane-gimp
