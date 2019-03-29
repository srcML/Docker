<<<<<<< HEAD
FROM srcml/ubuntu_x86_64_base:17.10
=======
FROM srcml/ubuntu_x86_64_base:16.04
>>>>>>> fa0c82b4d1485b131e5251d01de1af6017994ec0

CMD ["/bin/bash", \
     "-c", \
     "mkdir /srcML-build; \
      cd /srcML-build; \
      cmake /srcML; \
      make -j2; \
      cpack; \
      cpack -G DEB; \
<<<<<<< HEAD
      mv dist/srcML*.tar.gz /srcML_builds/ubuntu_17.10_x86_64.tar.gz; \
      mv dist/srcML*.deb /srcML_builds/ubuntu_17.10_x86_64.deb "]
=======
      mv dist/srcML*.tar.gz /srcML_builds/ubuntu_16.04_x86_64.tar.gz; \
      mv dist/srcML*.deb /srcML_builds/ubuntu_16.04_x86_64.deb "]
>>>>>>> fa0c82b4d1485b131e5251d01de1af6017994ec0
