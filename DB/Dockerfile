
FROM ubuntu:trusty
MAINTAINER michael@scaledb.com

RUN apt-get update
RUN apt-get -y install wget zip 
RUN apt-get install libaio1



RUN /usr/bin/wget http://downloads.scaledb.com/2a4394f731aa13e965eeb2c09f78543e/scaledb-16.04/scaledb-16.04.01/scaledb-mariadb-16.04.01-10.1.13.tgz
RUN gunzip scaledb-mariadb-16.04.01-10.1.13.tgz
RUN tar xvf scaledb-mariadb-16.04.01-10.1.13.tar
RUN mv  /usr/local/scaledb-mariadb-16.04.01-10.1.13 /usr/local/mariadb


RUN /usr/bin/wget http://downloads.scaledb.com/2a4394f731aa13e965eeb2c09f78543e/scaledb-16.04/scaledb-16.04.01/scaledb-ude-16.04.01-P18863.tgz
RUN gunzip scaledb-ude-16.04.01-P18863.tgz
RUN tar  xvf scaledb-ude-16.04.01-P18863.tar
RUN mv /usr/local/scaledb-ude-16.04.01-P18863 /usr/local/scaledb



RUN apt-get install libssl1.0.0 
RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/libssl.so.10
RUN ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/libcrypto.so.10

 

ADD ./start_db.sh /start_db.sh
ADD ./my.cnf.1  /my.cnf.1
ADD ./scaledb.cnf.1 /scaledb.cnf.1

#CMD ./start_db.sh

