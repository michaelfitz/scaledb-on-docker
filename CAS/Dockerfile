
FROM ubuntu:trusty
MAINTAINER michael@scaledb.com

RUN apt-get update
RUN apt-get -y install wget zip 
RUN apt-get install libaio1

RUN /usr/bin/wget http://downloads.scaledb.com/2a4394f731aa13e965eeb2c09f78543e/scaledb-16.04/scaledb-16.04.01/scaledb-ude-16.04.01-P18863.tgz

RUN gunzip scaledb-ude-16.04.01-P18863.tgz
RUN tar  xvf scaledb-ude-16.04.01-P18863.tar

RUN mv usr/local/scaledb-ude-16.04.01-P18863 /usr/local/scaledb

#RUN /usr/bin/wget http://downloads.scaledb.com/2a4394f731aa13e965eeb2c09f78543e/scaledb-16.04/scaledb-16.04.01/scaledb-mariadb-16.04.01-10.1.13.tgz

#RUN gunzip scaledb-mariadb-16.04.01-10.1.13.tgz
#RUN tar xvf  scaledb-mariadb-16.04.01-10.1.13.tar
#RUN mv scaledb-0.2.6-7510 scaledb-0.2.5
 

#lets start cas and slm
ADD ./start.sh /start.sh
ADD ./cas.cnf.1  /cas.cnf.1
ADD ./startex.sh /startex.sh
CMD ./startex.sh

