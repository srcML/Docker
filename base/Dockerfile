FROM fedora:24
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="fedora" \
      org.srcml.osversion="24" \
      org.srcml.architecture="x86_64" \
      org.srcml.boost="1.64.0"

# Update and install dependencies
RUN dnf upgrade -y && dnf install -y \
    tar \
    curl \
    gcc-c++ \
    make \
    cmake \
    antlr \
    antlr-C++ \
    libxml2-devel \
    libxslt-devel \
    libarchive-devel \
    libcurl-devel \
    openssl-devel \
    python \
    bzip2 \
    cpio \
    zip

# Download and install a newer binary version of cmake
ENV CMAKE_BIN_URL https://cmake.org/files/v3.8/cmake-3.8.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download, build, and install boost from source
ENV BOOST_MINOR_VERSION 64
RUN mkdir /boost-Build \
    && curl -L https://sourceforge.net/projects/boost/files/boost/1.${BOOST_MINOR_VERSION}.0/boost_1_${BOOST_MINOR_VERSION}_0.tar.gz | \
    tar xz --strip-components=1 -C /boost-Build \
    && cd /boost-Build \
    && ./bootstrap.sh --with-libraries=program_options,filesystem,thread,date_time \
    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
    && rm -fR /boost-Build
