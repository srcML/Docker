FROM srcml/opensuse_x86_64_base:42.3

RUN echo opensuse_42.3_x86_64 > /name.txt

RUN zypper --non-interactive install --no-recommends python-yaml

COPY lst_image.py /lst_image.py

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=OFF -DCMAKE_BUILD_TYPE=Release /srcML; \
      make install; \
      ldconfig; \
      python /lst_image.py"]
