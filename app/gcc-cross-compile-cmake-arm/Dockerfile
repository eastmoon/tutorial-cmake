FROM debian:buster-slim

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

# Install cross compilers on host machine
RUN \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        gcc-aarch64-linux-gnu \
        g++-aarch64-linux-gnu

# Install c++ library dependency
ADD ./arch-arm64.cmake /arch-arm64.cmake
ADD ./libs /dep
RUN /dep/curl/install.sh
RUN /dep/date/install.sh
RUN rm -rf /dep

# Container setting
WORKDIR /repo
