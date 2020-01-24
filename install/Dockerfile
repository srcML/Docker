FROM centos:8

# Install man pages and other utilities for testing
RUN yum update -y && dnf install 'dnf-command(config-manager)' -y && dnf config-manager --set-enabled PowerTools && yum install -y \
    man \
    unzip \
    curl \
    cmake \
    ninja-build \
    libxslt \
    zip \
    bzip2

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=http://gehry.sdml.cs.kent.edu/build/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/
