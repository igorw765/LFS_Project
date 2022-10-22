#!/bin/bash

FILE=$1

echo
echo "Cleaning up..." 


cd $LFS/sources
DIR=$(echo $FILE | awk -F"\\\\.t" '{print $1}')
rm -fr $DIR

echo
echo "Done Processing $FILE"
echo
sleep 1