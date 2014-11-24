FROM       ubuntu:latest
MAINTAINER Alex Komyagin <alex@mongodb.com>

ENV mongo_version 2.7.8
ENV mongo_pkg mongodb-org-unstable

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
RUN apt-get update && apt-get install -y ${mongo_pkg}=${mongo_version} ${mongo_pkg}-server=${mongo_version} ${mongo_pkg}-shell=${mongo_version} ${mongo_pkg}-mongos=${mongo_version} ${mongo_pkg}-tools=${mongo_version}

RUN mkdir -p /data/db
EXPOSE 27017
COPY starter.sh /opt/starter.sh

ENTRYPOINT ["/opt/starter.sh"]
