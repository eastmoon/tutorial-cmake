FROM ubuntu:16.04

# Install common tools
RUN \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        software-properties-common \
        ca-certificates \
        curl \
        wget \
        rsync \
        git

RUN \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        zip \
        unzip \
        tar

# Install complier tools
RUN \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        g++ \
        python-dev \
        make \
        cmake

#
RUN \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt-get update -y && \
    apt-get install -y gcc-8 g++-8 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8

# Container setting
WORKDIR /repo
