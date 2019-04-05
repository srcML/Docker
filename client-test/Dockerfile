FROM srcml/centos_x86_64_base:7.1.1503

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON /srcML; \
      make install; \
      ldconfig; \
      ctest -VV -D Nightly -T MemCheck --overwrite Site='centos_7.1.1503_x86_64-client' "]
