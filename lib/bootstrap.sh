#!/bin/bash
#
# This file contains pre installation routines needed to make archlinux-postinstall
#to work
#

GIT=/usr/bin/git
KEYGEN=/usr/bin/ssh-keygen
CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh


configgit() {
	if [ ! -r ${HOME}/.gitconfig ]; then
		${GIT} config --global --edit
	fi
	if [ ! -r ${HOME}/.ssh/id_rsa.pub ]; then
		${KEYGEN}
	fi
}

upgrade-system
installpkg vim /usr/bin/vim
installpkg vi /usr/bin/vi
installpkg git /usr/bin/git
installpkg fakeroot /usr/bin/fakeroot
installpkg binutils /usr/bin/strip
installpkg make /usr/bin/make
installpkg gcc /usr/bin/gcc
installpkg ssh /usr/bin/ssh
configgit
