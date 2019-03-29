<<<<<<< HEAD
FROM srcml/ubuntu_x86_64_base:17.10

RUN echo ubuntu_17.10_x86_64 > /name.txt
=======
FROM srcml/ubuntu_x86_64_base:16.04

WORKDIR /srcML-build

RUN echo ubuntu_16.04_x86_64 > /name.txt
>>>>>>> fa0c82b4d1485b131e5251d01de1af6017994ec0

RUN apt-get install python-yaml -y

COPY lst_image.py /lst_image.py

<<<<<<< HEAD
WORKDIR /srcML-build

=======
>>>>>>> fa0c82b4d1485b131e5251d01de1af6017994ec0
CMD ["/bin/bash", \
     "-c", \
      "cmake -DBUILD_CLIENT_TESTS=OFF -DCMAKE_BUILD_TYPE=Release /srcML; \
      make install; \
      ldconfig; \
      python /lst_image.py"]
