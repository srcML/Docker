FROM centos:7

# Install man pages
RUN yum install -y man && \
    # Allow man page install
    sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/yum.conf
