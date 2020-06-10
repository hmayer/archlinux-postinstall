#!/bin/bash
#
# Install Mozilla Thunderbird
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install thunderbird
