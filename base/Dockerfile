ARG OPENSUSE_VERSION=15.2
FROM opensuse/leap:${OPENSUSE_VERSION} AS opensuse

FROM opensuse AS java
RUN  zypper --non-interactive install --no-recommends binutils curl

ARG TARGETPLATFORM
RUN case "${TARGETPLATFORM}" in \
         "linux/amd64")  ARCHITECTURE="x86_64"   ;; \
         "linux/arm64")  ARCHITECTURE="aarch64"  ;; \
         *)  exit 1 ;; \
    esac; \
    curl --insecure -L -O "https://download.oracle.com/java/17/latest/jdk-17_linux-${ARCHITECTURE}_bin.rpm" \
    && rpm -U jdk-17_linux-${ARCHITECTURE}_bin.rpm

RUN jlink --compress=2 --strip-debug --add-modules=java.base --output /opt/java \
    && strip -p --strip-unneeded /opt/java/lib/server/*.so \
    && strip -p --strip-unneeded /opt/java/lib/*.so

FROM opensuse
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="opensuse" \
      org.srcml.osversion="15.2"

# Copy lightweight jre install
COPY --from=java /opt/java /opt/java
ENV JAVA_HOME=/opt/java

# Update and install dependencies
RUN zypper --non-interactive install --no-recommends \
    curl \
    tar \
    gzip \
    gcc-c++ \
    git \
    make \
    ninja \
    which \
    java-headless \
    libxml2-devel \
    libxslt-devel \
    libarchive-devel \
    libcurl-devel \
    libopenssl-devel \
    zip \
    bzip2 \
    man \
    rpm-build \
    && zypper clean -a

# CMake
ARG TARGETPLATFORM
RUN case "${TARGETPLATFORM}" in \
         "linux/amd64")  ARCHITECTURE="x86_64"   ;; \
         "linux/arm64")  ARCHITECTURE="aarch64"  ;; \
         *)  exit 1 ;; \
    esac; \
    curl --insecure -L "https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-linux-${ARCHITECTURE}.tar.gz" | tar xz --strip-components=1 -C /usr/local
