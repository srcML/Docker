FROM opensuse/leap:15
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="opensuse" \
      org.srcml.osversion="15" \
      org.srcml.architecture="x86_64" \
      org.srcml.cmake="3.14.1" \
      org.srcml.boost="1.69.0" \
      org.srcml.antlr="2.7.7"

# Update and install dependencies
RUN zypper --non-interactive install --no-recommends \
    curl \
    tar \
    zip \
    gzip \
    gcc-c++ \
    make \
    which \
    java-headless \
    libxml2-devel \
    libxslt-devel \
    libarchive-devel \
    libcurl-devel \
    libopenssl-devel \
    python-devel \
    glibc-locale

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=https://cmake.org/files/v3.14/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download and install only needed boost files
RUN curl -L http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz | \
    tar xz -C /usr/local/include

# libantlr packages for this platform do not build with -fPIC
# Download, build, and install antlr from source
ARG ANTLR_SRC_URL=http://www.antlr2.org/download/antlr-2.7.7.tar.gz
RUN curl -L $ANTLR_SRC_URL | tar xz -C / \
    # Build and install antlr library (libantlr) from source
    && cd antlr-2.7.7 \
    # Compile with -fPIC by changing line 59 in scripts/cxx.sh.in
    && sed -i -e '59s/-pipe/-pipe -fPIC/' scripts/cxx.sh.in \
    # Remove initialization of EOF_CHAR on line 475 of CharScanner.hpp
    && sed -i -e '474s/= EOF/;/' lib/cpp/antlr/CharScanner.hpp \
    # Add initialization of EOF_CHAR on line 102 of CharScanner.cpp
    && sed -i -e '102s/EOF_CHAR;/EOF_CHAR = std::char_traits<char>::eof();/' lib/cpp/src/CharScanner.cpp \
    # Insert #include <string.h> in CharScanner.hpp
    && sed -i -e '1 i\#include <string.h>' lib/cpp/antlr/CharScanner.hpp \
    # build and install
    && ./configure --disable-examples && make install \
    && cp antlr.jar /usr/share/java/. \
    # remove build files
    && rm -fR /antlr-2.7.7
# install does not setup classpath
ENV CLASSPATH /usr/share/java/antlr.jar
