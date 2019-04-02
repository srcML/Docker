FROM fedora:29
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="fedora" \
      org.srcml.osversion="29" \
      org.srcml.architecture="x86_64" \
      org.srcml.boost="1.69.0" \
      org.srcml.cmake="3.8.2"

# Install dependencies
RUN dnf install -y \
    tar \
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
    python2 \
    bzip2 \
    cpio \
    zip \
    && dnf clean all

# Download, build, and install boost from source
ARG BOOST_MINOR_VERSION=69
RUN mkdir /boost-Build \
    && curl -L https://sourceforge.net/projects/boost/files/boost/1.${BOOST_MINOR_VERSION}.0/boost_1_${BOOST_MINOR_VERSION}_0.tar.gz | \
    tar xz --strip-components=1 -C /boost-Build \
    && cd /boost-Build \
    && ./bootstrap.sh --with-libraries=program_options \
    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
    && rm -fR /boost-Build
