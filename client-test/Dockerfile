FROM srcml/centos_x86_64_base:oldest

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON /srcML; \
      make install; \
      ldconfig; \
      ctest -VV -D Nightly -T MemCheck --overwrite Site='centos_oldest_x86_64-client' "]
