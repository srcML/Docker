FROM srcml/ubuntu_x86_64_base:latest

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
