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

RUN \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        qemu-system-arm
        
# Container setting
WORKDIR /repo
