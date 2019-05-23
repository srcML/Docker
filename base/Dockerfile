FROM ubuntu:devel
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="ubuntu" \
      org.srcml.osversion="devel" \
      org.srcml.architecture="x86_64" \
      org.srcml.cmake="3.14.1" \
      org.srcml.boost="1.69.0"

# Update and install dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    zip \
    g++ \
    make \
    ninja-build \
    antlr \
    libantlr-dev \
    libxml2-dev \
    libxml2-utils \
    libxslt1-dev \
    libarchive-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    cpio \
    man \
    && rm -rf /var/lib/apt/lists/*

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=https://cmake.org/files/v3.14/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download and install only needed boost files
RUN curl -L http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz | \
    tar xz -C /usr/local/include

# Allow man pages to be installed
RUN sed -i '/path-exclude=\/usr\/share\/man\/*/c\#path-exclude=\/usr\/share\/man\/*' /etc/dpkg/dpkg.cfg.d/excludes
