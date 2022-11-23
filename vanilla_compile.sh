#!/bin/bash

wget https://ftp.postgresql.org/pub/source/v9.2.0/postgresql-9.2.0.tar.gz
tar -zxvf postgresql-9.2.0.tar.gz
mkdir -p {dist,vbuild}
cd vbuild

../postgresql-9.2.0/configure --prefix=$(pwd)/../dist
make -j4
if [ $? -ne 0 ]; then
  echo "Failed to build memcached"
  exit 1
fi
make install
cd ../dist
./bin/initdb data
