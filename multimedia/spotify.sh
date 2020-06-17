#!/bin/bash
#
# Install Spotify
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install spotify /usr/bin/spotify
arch-install ffmpeg-compat-57 #to play local files
