FROM srcml/ubuntu_x86_64_base:17.10

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake -DBUILD_CLI_TESTS=ON /srcML; \
      make -j2; \
      ctest -VV -D Nightly -T MemCheck --overwrite Site='ubuntu_17.10_x86_64-client' "]
