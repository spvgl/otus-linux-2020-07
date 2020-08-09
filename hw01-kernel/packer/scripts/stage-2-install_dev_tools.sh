#!/bin/bash

echo "Start install packages for kernel compile"
yum groupinstall -y "Development Tools" 
yum install -y openssl-devel elfutils-libelf-devel bc bzip2 tar
echo "End install packages for kernel compile"
