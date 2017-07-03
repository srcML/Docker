FROM srcml/fedora_x86_64_base:rawhide

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G RPM; \
      mv dist/srcML*.tar.gz /srcML_builds/fedora_rawhide_x86_64.tar.gz; \
      mv dist/srcML*.deb /srcML_builds/fedora_rawhide_x86_64.rpm "]
