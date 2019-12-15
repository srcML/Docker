FROM ubuntu:19.04

RUN apt-get update -y && apt-get install --no-install-recommends -y \
    man \
    ninja-build \
    libxml2-utils \
    libxslt1.1; \
    # curl needed installed recommends
    apt-get install -y curl

RUN yes | unminimize

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=https://cmake.org/files/v3.14/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/
