FROM srcml/ubuntu_x86_64_base:devel

RUN echo ubuntu_devel_x86_64 > /name.txt

RUN apt-get install python-yaml -y

COPY lst_image.py /lst_image.py

WORKDIR /srcML-build

CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=OFF -DCMAKE_BUILD_TYPE=Release /srcML; \
      make install; \
      ldconfig; \
      python /lst_image.py"]
