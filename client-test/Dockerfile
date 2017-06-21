FROM srcml/ubuntu_x86_64_base:16.04

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_UNIT_TESTS=OFF -DBUILD_TIMING_TESTS=OFF -DBUILD_LARGE_SYSTEMS_TESTS=OFF /srcML; \
      make install; \
      ldconfig; \
      tail -f /dev/null"]
