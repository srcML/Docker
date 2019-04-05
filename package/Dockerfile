FROM srcml/centos_x86_64_base:7.2.1511

RUN yum update -y && yum install -y rpm-build

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G RPM; \
      mv dist/srcML*.tar.gz /srcML_builds/centos_7.2.1511_x86_64.tar.gz; \
      mv dist/srcML*.rpm /srcML_builds/centos_7.2.1511_x86_64.rpm "]
