#!/bin/bash -eux

apt-get -y update
apt-get -y dist-upgrade --force-yes
reboot
sleep 60
