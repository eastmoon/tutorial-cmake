#!/bin/bash
cd /tmp
root=${PWD}
prefix=${PWD}/cross/date
mkdir ${prefix}

# Preinstall library & Download source
wget https://github.com/HowardHinnant/date/archive/v2.4.1.tar.gz

# Compiler & Install
tar xvf v2.4.1.tar.gz
cd date-2.4.1
mkdir build
cd build
cmake -DBUILDSWIG=NO -DBUILDSWIGNODE=NO -DBUILDSWIGPYTHON=NO -DCMAKE_TOOLCHAIN_FILE=/arch-arm64.cmake -DCMAKE_INSTALL_PREFIX=${prefix} -DCURL_LIBRARY=/usr/local/lib -DCURL_INCLUDE_DIR=/usr/local/include ..
make -j4
make install

# Install to /usr/local
cp -r ${prefix}/* /usr/local

# Recovery
cd ${root}
rm v2.4.1.tar.gz
