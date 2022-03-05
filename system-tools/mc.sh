#!/bin/bash
#
# Install Midnight Commander
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install mc
arch-install p7zip
