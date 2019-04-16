FROM fedora:latest

# update zypper, and allow man pages to be installed
#	sed -i 's|\(rpm.install.excludedocs\)|#\1|g' /etc/zypp/zypp.conf && \
RUN dnf install -y man findutils && \
	sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/dnf/dnf.conf

ENV RPM=fedora_latest_x86_64.rpm
ENV RPMPATH=/srcML_builds/${RPM}

CMD ["/bin/bash", "-c", \
     "dnf install -y ${RPMPATH}; \
     srcml --text='a;' -l C++; \
     rpm -ql ${RPMPATH} | grep -v '.build-id' | xargs ls -lhd ; \
     man srcml | wc --lines; \
     "]
