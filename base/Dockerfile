FROM opensuse:13.2
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="opensuse" \
      org.srcml.osversion="13.1" \
      org.srcml.architecture="x86_64" \
      org.srcml.boost="1.55.0" \
      org.srcml.antlr="2.7.7"

# Update and install dependencies
RUN zypper --non-interactive install --no-recommends \
    curl \
    tar \
    gcc-c++ \
    cmake \
    java-headless \
    libxml2-devel \
    libxslt-devel \
    libarchive-devel \
    libcurl-devel \
    libopenssl-devel \
    python-devel

# Download, build, and install boost from source
ENV BOOST_MINOR_VERSION 55
RUN mkdir /boost-Build \
    && curl -L https://sourceforge.net/projects/boost/files/boost/1.${BOOST_MINOR_VERSION}.0/boost_1_${BOOST_MINOR_VERSION}_0.tar.gz | \
    tar xz --strip-components=1 -C /boost-Build \
    && cd /boost-Build \
    && ./bootstrap.sh --with-libraries=program_options,filesystem,thread,date_time \
    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
    && rm -fR /boost-Build

# libantlr packages for this platform do not build with -fPIC
# Download, build, and install antlr from source
ENV ANTLR_SRC_URL http://www.antlr2.org/download/antlr-2.7.7.tar.gz
RUN curl -L $ANTLR_SRC_URL | tar xz -C / \
    # Build and install antlr library (libantlr) from source
    && cd antlr-2.7.7 \
    # Compile with -fPIC by changing line 59 in scripts/cxx.sh.in
    && sed -i -e '59s/-pipe/-pipe -fPIC/' scripts/cxx.sh.in \
    # Replace EOF with 1 on line 475 of CharScanner.hpp
    && sed -i -e '474s/= EOF/= 1/' lib/cpp/antlr/CharScanner.hpp \
    # Insert #include <string.h> in CharScanner.hpp
    && sed -i -e '1 i\#include <string.h>' lib/cpp/antlr/CharScanner.hpp \
    # build and install
    && ./configure --disable-examples && make install \
    && cp antlr.jar /usr/share/java/. \
    # remove build files
    && rm -fR /antlr-2.7.7
# install does not setup classpath
ENV CLASSPATH /usr/share/java/antlr.jar
