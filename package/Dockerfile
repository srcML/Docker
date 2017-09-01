FROM srcml/centos_x86_64_base:7.3

CMD ["/bin/bash", \
     "-c", \
     "yum install rpmbuild; \
      mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G RPM; \
      mv dist/srcML*.tar.gz /srcML_builds/centos_7.3_x86_64.tar.gz; \
      mv dist/srcML*.rpm /srcML_builds/centos_7.3_x86_64.rpm "]
