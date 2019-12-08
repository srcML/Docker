FROM fedora:31

# Install man pages, and findutils for xargs
RUN dnf install -y man findutils && \
	# allow install of man pages
	sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/dnf/dnf.conf
