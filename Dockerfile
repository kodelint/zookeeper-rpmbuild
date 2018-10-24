# default build is for CentOS7, change the base image to fit your build.
FROM centos:centos7
MAINTAINER Kodelint "kodelint@gmail.com"

RUN yum install -y wget make rpmdevtools

ADD Makefile zookeeper.logrotate zookeeper.service zookeeper.spec zookeeper.sysconfig log4j.properties log4j-cli.properties zkcli zoo.cfg /repo/

RUN mkdir /repo/RPMS

WORKDIR /repo

VOLUME ["/repo/x86_64/"]

CMD make ; ls -l /repo/x86_64/
