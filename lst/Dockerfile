FROM srcml/ubuntu_x86_64_base:16.04

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=OFF -DCMAKE_BUILD_TYPE=Release /srcML; \
      make install; \
      ldconfig; \
      srcml /lst_data/data/linux_src.tar.gz -o /lst_data/ubuntu_16.04_x86_64_linux_src.xml; \
      gzip /lst_data/ubuntu_16.04_x86_64_linux_src.xml"]
