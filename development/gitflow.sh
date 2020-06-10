#!/bin/bash
#
# Install NVM - Node.js Version Manager
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install gitflow-avh
arch-install gitflow-zshcompletion-avh

echo 'source /usr/share/zsh/site-functions/git-flow-completion.zsh' >> ~/.zshrc
