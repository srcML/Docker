FROM ubuntu:latest    
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="ubuntu" \
      org.srcml.osversion="latest" \
      org.srcml.architecture="x86_64" \
      org.srcml.cmake="3.14.1" \
      org.srcml.boost="1.69.0"

WORKDIR /usr/src/app

RUN apt update
RUN apt -yq install g++ libxml2-dev libxslt1-dev libarchive-dev antlr libantlr-dev libcurl4-openssl-dev libssl-dev python curl

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=https://cmake.org/files/v3.14/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/

# Download and install only needed boost files
RUN curl -L http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz | \
    tar xz -C /usr/local/include

COPY . .

RUN mkdir -p build && cd build && cmake ../ && make -j4 && make install
RUN ldconfig

ENTRYPOINT [ "srcml" ]
