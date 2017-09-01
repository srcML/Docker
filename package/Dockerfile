FROM srcml/fedora_x86_64_base:25

CMD ["/bin/bash", \
     "-c", \
     "dnf install -y rpmbuild; \
      mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G RPM; \
      mv dist/srcML*.tar.gz /srcML_builds/fedora_25_x86_64.tar.gz; \
      mv dist/srcML*.rpm /srcML_builds/fedora_25_x86_64.rpm "]
