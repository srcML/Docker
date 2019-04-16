FROM srcml/centos_x86_64_base:latest

RUN yum update -y && yum install -y rpm-build

CMD ["/bin/bash", "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML -DCMAKE_BUILD_TYPE=Release; \
      make -j2; \
      cpack; \
      cpack -G RPM; \
      mv dist/srcML*.tar.gz /srcML_builds/centos_latest_x86_64.tar.gz; \
      mv dist/srcML*.rpm /srcML_builds/centos_latest_x86_64.rpm "]
