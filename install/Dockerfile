FROM opensuse/leap:15.2

# Update and install dependencies
RUN zypper --non-interactive install --no-recommends \
    curl \
    tar \
    gzip \
    make \
    ninja \
    curl \
    zip \
    bzip2 \
    man \
    cpio \
    libxslt1 \
    libxml2-tools \
    && zypper clean -a

# Download and install a newer binary version of cmake
ARG CMAKE_BIN_URL=http://gehry.sdml.cs.kent.edu/build/cmake-3.14.1-Linux-x86_64.tar.gz
RUN curl -L $CMAKE_BIN_URL | tar xz --strip-components=1 -C /usr/local/
