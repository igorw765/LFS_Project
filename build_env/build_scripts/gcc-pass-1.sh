#!/bin/bash

echo
echo "GCC pass 1"
echo
sleep 1

cd $LFS/sources
tar -xf gcc-12.2.0.tar.xz
cd gcc-12.2.0

tar -xf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr

tar -xf ../gmp-6.2.1.tar.xz
mv -v gmp-6.2.1 gmp

tar -xf ../mpc-1.2.1.tar.gz
mv -v mpc-1.2.1 mpc

mkdir -v build
cd       build

../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.36 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-decimal-float   \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++

make
make install

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
    `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h

cd $LFS/sources

rm -fr gcc-12.2.0.tar.xz