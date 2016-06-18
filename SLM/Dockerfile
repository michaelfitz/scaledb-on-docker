
FROM ubuntu:trusty
MAINTAINER michael@scaledb.com

RUN apt-get update
RUN apt-get -y install wget zip 
RUN apt-get install libaio1


RUN /usr/bin/wget http://downloads.scaledb.com/2a4394f731aa13e965eeb2c09f78543e/scaledb-16.04/scaledb-16.04.01/scaledb-ude-16.04.01-P18863.tgz

RUN gunzip scaledb-ude-16.04.01-P18863.tgz
RUN tar  xvf scaledb-ude-16.04.01-P18863.tar

RUN mv usr/local/scaledb-ude-16.04.01-P18863 /usr/local/scaledb


 

#lets start cas and slm
ADD ./start_slm.sh /start_slm.sh
ADD ./slm.cnf.1  /slm.cnf.1
CMD ./start_slm.sh

