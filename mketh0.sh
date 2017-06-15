#!/bin/bash
GRUB_FILE='/etc/default/grub'

ADD='net.ifnames=0 biosdevname=0'

echo "[+] Editing /etc/default/grub"

sed -i "s/^\(GRUB_CMDLINE_LINUX\s*=.*\)\"\$/\1 $ADD\"/" $GRUB_FILE

grep ^GRUB_CMDLINE_LINUX= $GRUB_FILE

echo "[+] Making new grub config"

grub-mkconfig -o /boot/grub/grub.cfg

echo "[+] Changing /etc/network/interfaces"

sed -i "s/ens33/eth0/g" /etc/network/interfaces"

grep eth0 /etc/network/interfaces

echo "[+] Complete!"
