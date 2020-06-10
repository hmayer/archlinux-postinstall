#!/bin/bash
#
# This file intents to install yay package manager
#

export AP_TMP=${HOME}/.cache/archlinux-postinstall/
export GIT=/usr/bin/git

YAY_REPO="https://aur.archlinux.org/yay.git"

installyay() {
	${GIT} clone ${YAY_REPO} ${AP_TMP}/yay
	cd ${AP_TMP}/yay
	makepkg -si
}

installyay
