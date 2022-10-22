#!/bin/bash

echo
echo "Glibc"
echo
sleep 1


cd $LFS/sources
tar -xf glibc-2.36.tar.xz
cd glibc-2.36

ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3

patch -Np1 -i ../glibc-2.36-fhs-1.patch

mkdir -v build
cd       build

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/usr/lib

make
make DESTDIR=$LFS install

sleep 5

echo
echo "TESTING GLIBC"
echo
echo 'int main(){}' | gcc -xc -
readelf -l a.out | grep ld-linux
rm -v a.out

sleep 5


$LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders





cd $LFM/sources
rm -rf glibc-2.36