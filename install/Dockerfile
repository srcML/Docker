FROM fedora:latest

# Install man pages and other utilities for testing
RUN dnf install -y \
    man \
    curl \
    cmake \
    ninja-build \
    findutils \
    diffutils \
    libxslt \
    zip \
    bzip2 \
    cpio && \
    # allow install of man pages
    sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/dnf/dnf.conf

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=http://gehry.sdml.cs.kent.edu/build/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/
