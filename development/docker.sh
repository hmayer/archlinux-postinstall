#!/bin/bash
#
# Install docker
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install docker
arch-install docker-compose

${SUDO} gpasswd -a ${USER} docker

