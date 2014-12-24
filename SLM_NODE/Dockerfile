
FROM ubuntu:trusty
MAINTAINER michael@scaledb.com

RUN apt-get update
RUN apt-get -y install wget zip 
RUN apt-get install libaio1

#RUN /usr/bin/wget pub.scaledb.com/dump/7a065244ed65b3079e8227f3dfdca8eb/scaledb-0.2.5.tar.gz
#RUN gunzip scaledb-0.2.5.tar.gz
#RUN tar xvf  scaledb-0.2.5.tar && \
#    rm scaledb-0.2.5.tar



RUN /usr/bin/wget pub.scaledb.com/dump/7a065244ed65b3079e8227f3dfdca8eb/scaledb-0.2.6-7510.tar.gz
RUN gunzip scaledb-0.2.6-7510.tar.gz
RUN tar xvf  scaledb-0.2.6-7510.tar
RUN mv scaledb-0.2.6-7510 scaledb-0.2.5

 

#lets start cas and slm
ADD ./start_slm.sh /start_slm.sh
ADD ./slm.cnf.1  /slm.cnf.1
CMD ./start_slm.sh

