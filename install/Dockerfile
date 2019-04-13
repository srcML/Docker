FROM srcml/opensuse_x86_64_base:latest

RUN zypper --non-interactive install --no-recommends rpm-build

CMD ["/bin/bash", \
     "-c", \
     "zypper --non-interactive install --no-recommends /srcML_builds/opensuse_latest_x86_64.rpm; \
      srcml --text='a;' -l C++"]
