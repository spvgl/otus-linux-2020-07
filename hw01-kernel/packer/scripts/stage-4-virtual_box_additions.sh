#!/bin/bash

echo "Start install VB Guest Additions"

yum install -y epel-release
yum install -y dkms

mkdir /media/VBoxGuestAdditions
mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /media/VBoxGuestAdditions/
/bin/sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run --nox11
umount /media/VBoxGuestAdditions
rmdir /media/VBoxGuestAdditions

echo "End install VB Guest Additions"

# Reboot VM
shutdown -r now
