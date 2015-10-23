#!/bin/bash -eux

SSH_USER=${SSH_USERNAME:-vagrant}
CLEANUP_PAUSE=${CLEANUP_PAUSE:-0}
sleep ${CLEANUP_PAUSE}

rm /lib/udev/rules.d/75-persistent-net-generator.rules

if [ -d "/var/lib/dhcp" ]; then
    rm /var/lib/dhcp/*
fi

echo "pre-up sleep 2" >> /etc/network/interfaces

apt-get -y autoremove --purge
apt-get -y clean
apt-get -y autoclean
dpkg --get-selections | grep -v deinstall

rm -rf /dev/.udev/
rm -rf /tmp/* || ! false
