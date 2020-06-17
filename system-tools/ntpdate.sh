#!/bin/bash
#
# Install NTP client tools
#

CURRENTDIR=$(dirname $(readlink -f $0))

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

# Yes we need cron
arch-install vixie-cron /usr/bin/cron #i like this crond implementation
arch-install ntpdate /usr/bin/ntpdate

${SUDO} systemctl enable crond

${SUDO} su -c 'cat > /etc/cron.hourly/ntpdate <<EOF
/usr/bin/ntpdate 0.pool.ntp.org
EOF
'
${SUDO} chmod +x /etc/cron.hourly/ntpdate
${SUDO} systemctl start crond
