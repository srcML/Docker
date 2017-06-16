FROM srcml/ubuntu_x86_64_base:16.04

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake -DBUILD_CLI_TESTS=ON /srcML; \
      make -j2; \
      ctest -VV -D Nightly -T MemCheck --overwrite Site='ubuntu_16.04_x86_64-client' "]
