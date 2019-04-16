FROM opensuse/tumbleweed:latest

RUN zypper refresh && \
	# allow install of man pages
	sed -i 's|\(rpm.install.excludedocs\)|#\1|g' /etc/zypp/zypp.conf && \
	# install man
	zypper --non-interactive install --no-recommends man; 

ENV RPM=opensuse_latest_x86_64
ENV RPMPATH=/srcML_builds/${RPM}.rpm

CMD ["/bin/bash", "-c", \
     "zypper --non-interactive --no-gpg-checks install --no-recommends ${RPMPATH}; \
     srcml --text='a;' -l C++; \
     rpm -ql ${RPMPATH} | xargs ls -lhd ; \
     man srcml | wc --lines; \
     man srcml | head; \
     "]
