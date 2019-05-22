FROM centos:7.6.1810
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="centos" \
      org.srcml.osversion="7.6.1810" \
      org.srcml.architecture="x86_64" \
      org.srcml.boost="1.69.0" \
      org.srcml.cmake="3.14.1"

# Update and install dependencies
RUN yum install -y \
    which \
    zip \
    gcc-c++ \
    make \
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

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=https://cmake.org/files/v3.14/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download and install only needed boost files
RUN curl -L http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz | \
    tar xz -C /usr/local/include
