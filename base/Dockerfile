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
    antlr \
    libantlr-dev \
    libxml2-dev \
    libxml2-utils \
    libxslt1-dev \
    libarchive-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    python \
    && rm -rf /var/lib/apt/lists/*

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=https://cmake.org/files/v3.14/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download, build, and install boost from source
ARG BOOST_MINOR_VERSION=67
RUN mkdir /boost-Build \
    && curl -L https://sourceforge.net/projects/boost/files/boost/1.${BOOST_MINOR_VERSION}.0/boost_1_${BOOST_MINOR_VERSION}_0.tar.gz | \
    tar xz --strip-components=1 -C /boost-Build \
    && cd /boost-Build \
    && ./bootstrap.sh --with-libraries=program_options \
    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
    && rm -fR /boost-Build
