#!/bin/bash
root=${PWD}

# Preinstall library & Download source
apt-get update -y
apt-get install -y libcurl4-nss-dev
wget https://github.com/HowardHinnant/date/archive/v2.4.1.tar.gz

# Compiler & Install
tar xvf v2.4.1.tar.gz
cd date-2.4.1
mkdir build
cd build
cmake ..
make -j4
make install

# Recovery
cd ${root}
rm -rf v2.4.1.tar.gz
rm -rf date-2.4.1
