ARG UBUNTU_VERSION=22.04
FROM ubuntu:${UBUNTU_VERSION} AS ubuntu

# Generate lightweight jre
FROM ubuntu AS java
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q \
 && apt-get upgrade -q -y \
 && apt-get install -q -y \
        binutils \
        openjdk-11-jdk-headless

RUN jlink --compress=2 --strip-debug --add-modules=java.base --output /opt/java \
    && strip -p --strip-unneeded /opt/java/lib/server/*.so \
    && strip -p --strip-unneeded /opt/java/lib/*.so

FROM ubuntu
LABEL org.srcml.email="srcmldev@gmail.com"
LABEL org.srcml.url="srcml.org"
LABEL org.srcml.distro="ubuntu"
LABEL org.srcml.osversion="${UBUNTU_VERSION}"

# Copy lightweight jre install
COPY --from=java /opt/java /opt/java
ENV JAVA_HOME=/opt/java

# Avoid prompts for timezone
ENV TZ=US/Michigan
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update and install dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    git \
    zip \
    g++ \
    make \
    ninja-build \
    libxml2-dev \
    libxml2-utils \
    libxslt1-dev \
    libarchive-dev \
    libcurl4-openssl-dev \
    ca-certificates \
    cpio \
    man \
    file \
    valgrind \
    ccache \
    dpkg-dev \
    && rm -rf /var/lib/apt/lists/*

# CMake
ARG TARGETPLATFORM
RUN case "${TARGETPLATFORM}" in \
         "linux/amd64")  ARCHITECTURE="x86_64"   ;; \
         "linux/arm64")  ARCHITECTURE="aarch64"  ;; \
         *)  exit 1 ;; \
    esac; \
    curl --insecure -L "https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1-linux-${ARCHITECTURE}.tar.gz" | tar xz --strip-components=1 -C /usr/local

# Allow man pages to be installed
RUN sed -i '/path-exclude=\/usr\/share\/man\/*/c\#path-exclude=\/usr\/share\/man\/*' /etc/dpkg/dpkg.cfg.d/excludes

# Put ccache into the path
ENV PATH /usr/lib/ccache:$PATH
RUN export PATH=/usr/lib/ccache/:$PATH
