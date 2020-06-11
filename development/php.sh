
#!/bin/bash
#
# Install PHP
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install php
arch-install php-sqlite
arch-install php-gd
arch-install composer
