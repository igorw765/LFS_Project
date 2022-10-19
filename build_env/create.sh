#!/bin/bash

echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"
echo "Creating build enviroment..."

if ! test $(whoami) == "distbuild" ; then
    echo "Must run as distbuild!"
    exit -1
fi