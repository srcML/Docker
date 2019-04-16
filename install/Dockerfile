FROM opensuse/tumbleweed:latest

# update zypper, and allow man pages to be installed
RUN zypper refresh && \
	sed -i 's|\(rpm.install.excludedocs\)|#\1|g' /etc/zypp/zypp.conf && \
	zypper --non-interactive install --no-recommends man; 

ENV RPM=opensuse_latest_x86_64.rpm
ENV RPMPATH=/srcML_builds/${RPM}

CMD ["/bin/bash", "-c", \
     "zypper --non-interactive --no-gpg-checks install --no-recommends ${RPMPATH}; \
     srcml --text='a;' -l C++; \
     rpm -ql ${RPMPATH} | xargs ls -lhd ; \
     man srcml | wc --lines; \
     "]
