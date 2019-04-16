FROM centos:latest

# Install man pages
# Install findutils to get xargs
# Allow man pages to be installed

RUN yum install -y man

#RUN dnf install -y man findutils && \
#	sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/dnf/dnf.conf

ENV RPM=centos_latest_x86_64.rpm
ENV RPMPATH=/srcML_builds/${RPM}

#     rpm -ql ${RPMPATH} | grep -v '.build-id' | xargs ls -lhd ; \
CMD ["/bin/bash", "-c", \
     "yum install -y ${RPMPATH}; \
     srcml --text='a;' -l C++; \
     repoquery --list srcML; \
     man srcml | wc --lines; \
     man srcml | head; \
     "]
