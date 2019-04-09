FROM centos:7.0.1406
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="centos" \
      org.srcml.osversion="7.0.1406" \
      org.srcml.architecture="x86_64" \
      org.srcml.boost="1.69.0" \
      org.srcml.cmake="3.14.1"

# Update and install dependencies
RUN yum install -y --skip-broken \
    which \
    zip \
    tar \
    gcc-c++ \
    make \
    cmake \
    antlr \
    antlr-C++ \
    libxml2 \
    libxml2-devel \
    libxslt-devel \
    libarchive-devel \
    openssl-devel \
    libcurl-devel \
    python \
    && yum clean all \
    && rm -rf /var/cache/yum

# NOTE: curl needs to run with --tlsv1 to avoid error 35

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=https://cmake.org/files/v3.14/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl --tlsv1 -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download, build, and install boost from source
ARG BOOST_MINOR_VERSION=69
RUN mkdir /boost-Build \
    && curl --tlsv1  -L https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz | \
    tar xz --strip-components=1 -C /boost-Build \
    && cd /boost-Build \
    && ./bootstrap.sh --with-libraries=program_options \
    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
    && rm -fR /boost-Build
