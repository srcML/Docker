FROM srcml/ubuntu_x86_64_base:latest

RUN apt-get update && apt-get install --no-install-recommends -y \
    debhelper \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G DEB; \
      mv dist/srcML*.tar.gz /srcML_builds/ubuntu_latest_x86_64.tar.gz; \
      mv dist/srcML*.deb /srcML_builds/ubuntu_latest_x86_64.deb "]
