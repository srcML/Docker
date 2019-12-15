FROM centos:7

# Install man pages and other utilities for testing
RUN yum update -y && yum install -y \
    man \
    unzip \
    curl \
    cmake \
    ninja-build \
    libxslt \
    zip \
    bzip2

# Install ninja
RUN curl -L -O https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip \
    && unzip ninja-linux.zip \
    && mv ninja /usr/local/bin/. \
    && rm -fR ninja-linux

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=http://gehry.sdml.cs.kent.edu/build/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/
