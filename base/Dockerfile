FROM centos:8
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="centos" \
      org.srcml.osversion="8" \
      org.srcml.architecture="x86_64"

# Update and install dependencies
RUN dnf install -y 'dnf-command(config-manager)' && dnf config-manager --set-enabled PowerTools && dnf -y module enable javapackages-tools && dnf upgrade -y && dnf install -y \
    which \
    zip \
    unzip \
    gcc-c++ \
    make \
    git \
    ninja-build \
    java-11-openjdk-headless \
    libxml2-devel \
    libxslt-devel \
    libarchive-devel \
    openssl-devel \
    libcurl-devel \
    bzip2 \
    man \
    rpm-build \
    && dnf clean all \
    && rm -rf /var/cache/yum

# CMake
ARG TARGETPLATFORM
RUN case "${TARGETPLATFORM}" in \
         "linux/amd64")  ARCHITECTURE="x86_64"   ;; \
         "linux/arm64")  ARCHITECTURE="aarch64"  ;; \
         *)  exit 1 ;; \
    esac; \
    curl --insecure -L "https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-linux-${ARCHITECTURE}.tar.gz" | tar xz --strip-components=1 -C /usr/local

# Download and install only needed boost files
RUN curl -L http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz | \
    tar xz -C /usr/local/include
