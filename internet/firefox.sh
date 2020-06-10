#!/bin/bash
#
# Install Mozilla Firefox
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install firefox
