FROM srcml/ubuntu_x86_64_base:latest
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="ubuntu" \
      org.srcml.osversion="latest" \
      org.srcml.architecture="x86_64" \
      org.srcml.purpose="client-test"

RUN apt-get update && apt-get install cpio

WORKDIR /srcML-build

CMD ["/bin/bash", "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_LIBSRCML_TESTS=OFF -DBUILD_PARSER_TESTS=OFF /srcML; \
      make -j 4 install; \
      ldconfig; \
      ctest -VV --no-compress-output -T Test; \
      find . -name 'Test.xml'; \
      find . -name 'Test.xml' | xargs -t -I% cp % /PublishTest/.; \
      ls -alh /PublishTest; \
     "]
