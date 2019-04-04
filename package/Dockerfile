FROM srcml/fedora_x86_64_base:29

RUN dnf upgrade -y && dnf install -y rpm-build

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G RPM; \
      mv dist/srcML*.tar.gz /srcML_builds/fedora_29_x86_64.tar.gz; \
      mv dist/srcML*.rpm /srcML_builds/fedora_29_x86_64.rpm "]
