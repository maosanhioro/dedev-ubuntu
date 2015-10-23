#!/bin/bash -eux

count=$(df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}')
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1M count=$count
rm /tmp/whitespace

count=$(df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}')
let count--
dd if=/dev/zero of=/boot/whitespace bs=1M count=$count
rm /boot/whitespace

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

sync
