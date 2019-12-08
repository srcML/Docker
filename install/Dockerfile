FROM fedora:31

# Install man pages and other utilities for testing
RUN dnf install -y man findutils diffutils libxslt zip bzip2 cpio && \
    # allow install of man pages
    sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/dnf/dnf.conf
