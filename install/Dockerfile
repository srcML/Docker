FROM opensuse/tumbleweed:latest

RUN zypper refresh && \
	# allow install of man pages
	sed -i 's|\(rpm.install.excludedocs\)|#\1|g' /etc/zypp/zypp.conf && \
	# install man
	zypper --non-interactive install --no-recommends man curl; 

RUN curl -L -w '\n' https://github.com/mlcollard.gpg -o srcml.gpg && rpm --import srcml.gpg && rm -f srcml.gpg
