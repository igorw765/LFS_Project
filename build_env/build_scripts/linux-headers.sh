#!/bin/bash

echo
echo "Linux Headers"
echo
sleep 1

cd $LFS/sources
tar -xf linux-5.19.2.tar.xz
cd linux-5.19.2

make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

cd $LFM/sources
rm -fr linux-5.19.2