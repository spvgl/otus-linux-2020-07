#!/bin/bash

echo "Start get kernel sources"
yum install -y wget 
wget https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-4.20.17.tar.gz
tar -xvf linux-4.20.17.tar.gz -C /usr/src/kernels/
ln -s /usr/src/kernels/linux-4.20.17 /usr/src/linux
echo "End get kernel sources"

echo "Start kernel config"
cd /usr/src/linux
make defconfig

cat << EOF_CFG >> /usr/src/linux/.config

CONFIG_XFS_FS=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y

EOF_CFG

echo "End kernel config"

echo "Start kernel compile"
make bzImage
make modules
echo "End kernel compile"

echo "Start kernel install"
make modules_install
make install
echo "End kernel install"

echo "Start GRUB update"
grub2-mkconfig -o /boot/grub2/grub.cfg
grub2-set-default 1
echo "End GRUB update"

# Reboot VM
shutdown -r now
