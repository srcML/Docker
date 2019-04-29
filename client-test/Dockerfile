FROM srcml/ubuntu_x86_64_base:latest
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="ubuntu" \
      org.srcml.osversion="latest" \
      org.srcml.architecture="x86_64" \
      org.srcml.purpose="client-test"

RUN apt-get update && apt-get install cpio

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
  	 "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_LIBSRCML_TESTS=OFF -DBUILD_PARSER_TESTS=OFF -DBUILD_EXAMPLES=OFF /srcML; \
	  make install; \
      ldconfig; \
      ctest -VV -D Nightly -T Test --overwrite Site='ubuntu_x86_64-client'; \
      find . -name 'Test.xml' | xargs -t -I% cp % /PublishTest/$(find . -name "Test.xml" | head -1 | xargs sha1sum | cut -c1-6)-Test.xml \
      "]
