FROM srcml/fedora_x86_64_base:earliest

RUN echo fedora_earliest_x86_64 > /name.txt

RUN dnf install -y python-yaml

COPY lst_image.py /lst_image.py

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=OFF -DCMAKE_BUILD_TYPE=Release /srcML; \
      make install; \
      ldconfig; \
      python /lst_image.py"]
