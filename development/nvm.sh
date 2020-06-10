#!/bin/bash
#
# Install NVM - Node.js Version Manager
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc

