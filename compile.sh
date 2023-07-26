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
cd ..
echo "export PSANDBOX_POSTGRES_DIR=`pwd`/dist" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=`pwd`/dist/lib:$LD_LIBRARY_PATH" >> $HOME/.bashrc
echo "export PATH=`pwd`/dist/bin:$PATH" >> $HOME/.bashrc
