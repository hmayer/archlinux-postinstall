#!/bin/bash
#
# Install mlocate
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install neovim
arch-install lunarvim-git
arch-install rust
arch-install ripgrep

/usr/share/lunarvim/init-lvim.sh

