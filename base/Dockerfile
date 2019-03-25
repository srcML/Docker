FROM ubuntu:18.10
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="ubuntu" \
      org.srcml.osversion="18.10" \
      org.srcml.architecture="x86_64" \
      org.srcml.boost="1.67.0"

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    cpio \
    zip \
    g++ \
    make \
    cmake \
    antlr \
    libantlr-dev \
    libxml2-dev \
    libxml2-utils \
    libxslt1-dev \
    libarchive-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    python-dev

## Download and install a newer binary version of cmake
#ARG CMAKE_BIN_URL=https://cmake.org/files/v3.11/cmake-3.11.2.tar.gz
#RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download, build, and install boost from source
ARG BOOST_MINOR_VERSION=67
RUN mkdir /boost-Build \
    && curl -L https://sourceforge.net/projects/boost/files/boost/1.${BOOST_MINOR_VERSION}.0/boost_1_${BOOST_MINOR_VERSION}_0.tar.gz | \
    tar xz --strip-components=1 -C /boost-Build \
    && cd /boost-Build \
    && ./bootstrap.sh --with-libraries=program_options,filesystem,thread,date_time \
    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
    && rm -fR /boost-Build
