#!/bin/bash
root=${PWD}

# Preinstall library & Download source
apt-get update -y
apt-get install -y autotools-dev libicu-dev libbz2-dev
wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz
tar xvf boost_1_69_0.tar.gz
cd boost_1_69_0

# Compiler & Install
./bootstrap.sh --prefix=/usr/local/
./b2
./b2 install

# Recovery
cd ${root}
rm -rf boost_1_69_0.tar.gz
rm -rf boost_1_69_0
