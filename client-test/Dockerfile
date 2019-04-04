FROM srcml/ubuntu_x86_64_base:earliest
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="ubuntu" \
      org.srcml.osversion="earliest" \
      org.srcml.architecture="x86_64" \
      org.srcml.purpose="client-test"

WORKDIR /srcML-build

ARG OS_VERSION=earliest
CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_LIBSRCML_TESTS=OFF -DBUILD_PARSER_TESTS=OFF /srcML; \
      make install; \
      ldconfig; \
      ctest -VV -D Nightly -T MemCheck --overwrite Site='ubuntu_${OS_VERSION}_x86_64-client' "]
