echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"


if ! test $(whoami) == "distbuild" ; then
    echo "Must run as distbuild!"
    exit -1
fi

echo "Creating build enviroment..."
cd $DIST_ROOT/build_env

#bash -e build_scripts/binutils-pass-1.sh
#bash -e build_scripts/gcc-pass-1.sh
#bash -e build_scripts/linux-headers.sh
bash -e build_scripts/glibc.sh

echo "DONE!"