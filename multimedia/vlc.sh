#!/bin/bash
#
# Install Video Lan Client - VLC
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install vlc
