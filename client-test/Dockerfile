FROM srcml/opensuse_x86_64_base:oldest

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_UNIT_TESTS=OFF -DBUILD_TIMING_TESTS=OFF /srcML; \
      make install; \
      ldconfig; \
      ctest -VV -D Nightly -T MemCheck --overwrite Site='opensuse_oldest_x86_64-client' "]
