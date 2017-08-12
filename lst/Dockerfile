FROM srcml/ubuntu_x86_64_base:14.04

WORKDIR /srcML-build

RUN echo ubuntu_14.04_x86_64 > /name.txt

RUN apt-get install python-yaml -y

COPY lst_image.py /lst_image.py

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=OFF -DCMAKE_BUILD_TYPE=Release /srcML; \
      make install; \
      ldconfig; \
      python /lst_image.py"]
