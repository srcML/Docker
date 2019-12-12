FROM centos:7.4.1708

# Install man pages
RUN yum install -y man zip bzip2 libxslt && \
    # Allow man page install
    sed -i 's|\(tsflags=nodocs\)|#\1|g' /etc/yum.conf
