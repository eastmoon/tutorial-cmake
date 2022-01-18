FROM debian:buster-slim

# Install common tools
RUN \
    apt-get update -y && \
    apt-get install -y  --no-install-recommends \
        apt-transport-https \
        software-properties-common \
        ca-certificates \
        libcurl4 \
        wget \
        rsync

# Install complier tools
RUN \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update -y && \
    apt-get install -y  --no-install-recommends \
        build-essential \
        gcc \
        g++ \
        gdb \
        ninja-build \
        python-dev \
        make \
        cmake

# Install visual stauio control
RUN \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update -y && \
    apt-get install -y  --no-install-recommends \
        openssh-server

# Install c++ library dependency
ADD ./libs /dep
RUN /dep/boost/install.sh
RUN rm -rf /dep

# Container setting
## Connection port
EXPOSE 22
