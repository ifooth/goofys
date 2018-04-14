FROM centos:7.4.1708

RUN yum install -y fuse wget && yum clean all

ENV BIN_VERSION=v0.19.0

RUN set -ex;\
    cd /usr/local/bin;\
    wget https://github.com/kahing/goofys/releases/download/$BIN_VERSION/goofys;\
    chmod a+x goofys

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]