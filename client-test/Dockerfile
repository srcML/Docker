FROM srcml/opensuse_x86_64_base:latest

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_LIBSRCML_TESTS=OFF -DBUILD_PARSER_TESTS=OFF /srcML; \
      make install; \
      ldconfig; \
      ctest -VV -D Nightly -T Test --overwrite Site='centos_latest_x86_64-client'; \
      find . -name 'Test.xml' | xargs -t -I% cp % /PublishTest/$(find . -name "Test.xml" | head -1 | xargs sha1sum | cut -c1-6)-Test.xml \
      "]

