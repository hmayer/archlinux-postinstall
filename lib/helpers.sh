#!/bin/bash
#
# Some helpers to installation tasks
#
export PACMAN=/usr/bin/pacman
export YAY=/usr/bin/yay
export SUDO=/usr/bin/sudo

installpkg() {
	PACKAGE=$1
	FILE=$2
	if [ ! -r ${FILE} ] || [ "x" == "x${FILE}" ]; then
		${SUDO} ${PACMAN} -S ${PACKAGE}
	fi
}

upgrade-system() {
	${SUDO} ${PACMAN} -Syyu
}

arch-install() {
	PACKAGE=$1
	FILE=$2
	if [ ! -r ${FILE} ] || [ "x" == "x${FILE}" ]; then
		${YAY} -S --noconfirm ${PACKAGE}
	fi

}
