<<<<<<< HEAD
FROM srcml/ubuntu_x86_64_base:17.10
=======
FROM srcml/ubuntu_x86_64_base:16.04
>>>>>>> fa0c82b4d1485b131e5251d01de1af6017994ec0

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_UNIT_TESTS=OFF -DBUILD_TIMING_TESTS=OFF /srcML; \
      make install; \
      ldconfig; \
<<<<<<< HEAD
      ctest -VV -D Nightly -T MemCheck --overwrite Site='ubuntu_17.10_x86_64-client' "]
=======
      ctest -VV -D Nightly -T MemCheck --overwrite Site='ubuntu_16.04_x86_64-client' "]
>>>>>>> fa0c82b4d1485b131e5251d01de1af6017994ec0
