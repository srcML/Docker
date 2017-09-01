FROM srcml/opensuse_x86_64_base:42.3

CMD ["/bin/bash", \
     "-c", \
     "zypper --non-interactive install --no-recommends rpmbuild; \
      mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G RPM; \
      mv dist/srcML*.tar.gz /srcML_builds/opensuse_42.3_x86_64.tar.gz; \
      mv dist/srcML*.rpm /srcML_builds/opensuse_42.3_x86_64.rpm "]
