#!/bin/bash
#
# Install OpenFortiGUI Forticlient VPN
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install openfortigui
