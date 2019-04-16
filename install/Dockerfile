FROM centos:latest

# Install man pages
RUN yum install -y man && \
	# Allow man page install
	sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/yum.conf

ENV RPM=centos_latest_x86_64.rpm
ENV RPMPATH=/srcML_builds/${RPM}

CMD ["/bin/bash", "-c", \
     "yum install -y ${RPMPATH}; \
     srcml --text='a;' -l C++; \
     repoquery --list srcML; \
     man --version; \
     man srcml | wc --lines; \
     man srcml | head; \
    "]
