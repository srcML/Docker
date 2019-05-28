FROM fedora:27

# Install man pages, and findutils for xargs
RUN dnf install -y man findutils && \
	# allow install of man pages
	sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/dnf/dnf.conf

ENV RPM=fedora_latest_x86_64
ENV RPMPATH=/srcML_builds/${RPM}.rpm

CMD ["/bin/bash", "-c", \
     "dnf install -y ${RPMPATH} --disablerepo=updates; \
     srcml --text='a;' -l C++; \
     rpm -ql ${RPMPATH} | grep -v '.build-id' | xargs ls -lhd ; \
     man srcml | wc --lines; \
     man srcml | head; \
     "]
