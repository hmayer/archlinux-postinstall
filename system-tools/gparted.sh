#!/bin/bash
#
# Install Gparted
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install gparted
arch-install dosfstools
arch-install exfat-utils
arch-install ntfs-3g
arch-install mtools
