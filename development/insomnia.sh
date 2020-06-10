#!/bin/bash
#
# Install NVM - Node.js Version Manager
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install insomnia

