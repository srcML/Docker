FROM fedora:latest

# Install man pages
# Install findutils to get xargs
# Allow man pages to be installed
RUN dnf install -y man findutils && \
	sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/dnf/dnf.conf

ENV RPM=fedora_latest_x86_64.rpm
ENV RPMPATH=/srcML_builds/${RPM}

CMD ["/bin/bash", "-c", \
     "dnf install -y ${RPMPATH} --disablerepo=updates; \
     srcml --text='a;' -l C++; \
     rpm -ql ${RPMPATH} | grep -v '.build-id' | xargs ls -lhd ; \
     man srcml | wc --lines; \
     man srcml | head; \
     "]
