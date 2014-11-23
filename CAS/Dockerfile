
FROM ubuntu:trusty
MAINTAINER michael@scaledb.com

RUN apt-get update
RUN apt-get -y install wget zip 
RUN apt-get install libaio1
RUN /usr/bin/wget pub.scaledb.com/dump/7a065244ed65b3079e8227f3dfdca8eb/scaledb-0.2.5.tar.gz
RUN gunzip scaledb-0.2.5.tar.gz
RUN tar xvf  scaledb-0.2.5.tar && \
    rm scaledb-0.2.5.tar


 

#lets start cas and slm
ADD ./start.sh /start.sh
ADD ./cas.cnf.1  /cas.cnf.1
ADD ./startex.sh /startex.sh
CMD ./startex.sh

