FROM srcml/ubuntu_x86_64_base:19.04
LABEL org.srcml.email="srcmldev@gmail.com" \
      org.srcml.url="srcml.org" \
      org.srcml.distro="ubuntu" \
      org.srcml.osversion="19.04" \
      org.srcml.architecture="x86_64" \
      org.srcml.purpose="client-test"

WORKDIR /srcML-build

ARG OS_VERSION=17.10
CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=ON -DBUILD_LIBSRCML_TESTS=OFF -DBUILD_PARSER_TESTS=OFF /srcML; \
      make install; \
      ldconfig; \
      ctest -VV -D Nightly -T MemCheck --overwrite Site='ubuntu_${OS_VERSION}_x86_64-client' "]
