#!/bin/bash

# Clean after kernel compile
rm -rf /usr/src/kernels/linux-4.20.17
rm -f /usr/src/linux

# clean all
yum clean all

# Remove temporary files
rm -rf /tmp/*
rm  -f /var/log/wtmp /var/log/btmp
rm -rf /var/cache/* /usr/share/doc/*
rm -rf /var/cache/yum
rm -rf /vagrant/home/*.iso
rm  -f ~/.bash_history
history -c

rm -rf /run/log/journal/*

# Fill zeros all empty space
# dd if=/dev/zero of=/EMPTY bs=1M
# rm -f /EMPTY
sync
grub2-set-default 1
echo "###   Hi from clean stage" >> /boot/grub2/grub.cfg
