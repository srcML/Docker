FROM ubuntu:latest

RUN 	apt-get update && apt-get install --no-install-recommends -y man; 
	# allow install of man pages
#	sed -i 's|\(rpm.install.excludedocs\)|#\1|g' /etc/zypp/zypp.conf && \
	# install man

ENV RPM=ubuntu_latest_x86_64
ENV RPMPATH=/srcML_builds/${RPM}.deb

#     rpm -ql ${RPMPATH} | xargs ls -lhd ; \
CMD ["/bin/bash", "-c", \
     "apt-get install -y ${RPMPATH}; \
     srcml --text='a;' -l C++; \
     man srcml | wc --lines; \
     "]
