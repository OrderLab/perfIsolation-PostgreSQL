#!/bin/bash

mkdir -p {dist,build}
cd build

../9.2.0/configure --prefix=$(pwd)/../dist
make -j4
if [ $? -ne 0 ]; then
  echo "Failed to build memcached"
  exit 1
fi
make install
cd ../dist
./bin/initdb data
