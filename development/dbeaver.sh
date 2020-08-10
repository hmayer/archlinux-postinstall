#!/bin/bash
#
# Install DBeaver
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install dbeaver
arch-install dbeaver-plugin-office
arch-install dbeaver-plugin-svg-format
