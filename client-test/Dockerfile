FROM srcml/ubuntu_x86_64_base:17.10

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_UNIT_TESTS=OFF -DBUILD_TIMING_TESTS=OFF /srcML; \
      make install; \
      ldconfig; \
      ctest -VV -D Nightly-Client -T MemCheck --overwrite Site='ubuntu_17.10_x86_64-client' "]
