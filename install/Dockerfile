FROM centos:7.3.1611

# Install man pages
RUN yum install -y man bzip2 libxslt && \
    # Allow man page install
    sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/yum.conf
