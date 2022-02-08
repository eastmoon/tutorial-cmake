#!/bin/bash
cd /tmp
root=${PWD}
prefix=${PWD}/cross/curl
mkdir ${prefix}

# Preinstall library & Download source
# curl 7.47.0 (x86_64-pc-linux-gnu) libcurl/7.47.0 OpenSSL/1.0.2g zlib/1.2.8 libidn/1.32 libssh2/1.5.0
wget http://zlib.net/fossils/zlib-1.2.8.tar.gz
wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2g.tar.gz
wget https://www.libssh2.org/download/libssh2-1.5.0.tar.gz
wget https://github.com/curl/curl/releases/download/curl-7_47_0/curl-7.47.0.tar.gz

# Install zlib
tar xvf zlib-1.2.8.tar.gz
cd zlib-1.2.8/
CROSS_PREFIX=aarch64-linux-gnu- CFLAGS=-fPIC ./configure --static --shared --prefix=${prefix}
make -j4 install
cd ${root}

# Install openssl
tar xvf openssl-1.0.2g.tar.gz
cd openssl-1.0.2g/
./Configure linux-elf shared no-asm zlib-dynamic --prefix=${prefix} --cross-compile-prefix=aarch64-linux-gnu- --openssldir=ssl --with-zlib-include=${prefix}/include --with-zlib-lib=${prefix}/lib -fPIC
make -j4
make install
cd ${root}

# Install libssh2
tar xvf libssh2-1.5.0.tar.gz
cd libssh2-1.5.0/
./configure --host=arm-linux --prefix=${prefix} --disable-examples-build --with-openssl --with-libssl-prefix=${prefix} --with-libz --with-libz-prefix=${prefix} CC=aarch64-linux-gnu-gcc CFLAGS="-ldl -fPIC"
make -j4
make -j4 install
cd ${root}

# Install curl
# Compiler & Install
tar xvf curl-7.47.0.tar.gz
cd curl-7.47.0
./configure --disable-shared --host=arm-linux --prefix=${prefix} --with-ssl=${prefix} --with-libssh2=${prefix} --with-zlib=${prefix} CC=aarch64-linux-gnu-gcc CFLAGS=-fPIC
make -j4
make install
cd ${root}

# Install to /usr/local
cp -r ${prefix}/* /usr/local

# Recovery
rm zlib-1.2.8.tar.gz
rm openssl-1.0.2g.tar.gz
rm libssh2-1.5.0.tar.gz
rm curl-7.47.0.tar.gz
