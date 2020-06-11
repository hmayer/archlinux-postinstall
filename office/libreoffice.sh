#!/bin/bash
#
# Install Libreoffice
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install libreoffice-fresh
arch-install coin-or-mp #required by Calc
