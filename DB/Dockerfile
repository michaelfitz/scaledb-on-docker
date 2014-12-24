
FROM ubuntu:trusty
MAINTAINER michael@scaledb.com

RUN apt-get update
RUN apt-get -y install wget zip 
RUN apt-get install libaio1



#RUN /usr/bin/wget   pub.scaledb.com/dump/mariadb-10.0.12-linux-x86_64-small.tar.gz
#RUN gunzip mariadb-10.0.12-linux-x86_64-small.tar.gz
#RUN tar xvf  mariadb-10.0.12-linux-x86_64-small.tar  



RUN /usr/bin/wget pub.scaledb.com/dump/7a065244ed65b3079e8227f3dfdca8eb/mariadb-10.0.14-linux-x86_64.tar.gz
RUN gunzip mariadb-10.0.14-linux-x86_64.tar.gz
RUN tar xvf mariadb-10.0.14-linux-x86_64.tar
RUN mv  mariadb-10.0.14-linux-x86_64 mariadb-10.0.12-linux-x86_64

#RUN /usr/bin/wget pub.scaledb.com/dump/7a065244ed65b3079e8227f3dfdca8eb/scaledb-0.2.5.tar.gz
#RUN gunzip scaledb-0.2.5.tar.gz
#RUN tar xvf  scaledb-0.2.5.tar && \
#    rm scaledb-0.2.5.tar

RUN /usr/bin/wget pub.scaledb.com/dump/7a065244ed65b3079e8227f3dfdca8eb/scaledb-0.2.6-7510.tar.gz
RUN gunzip scaledb-0.2.6-7510.tar.gz
RUN tar xvf  scaledb-0.2.6-7510.tar 
RUN mv scaledb-0.2.6-7510 scaledb-0.2.5



RUN apt-get install libssl1.0.0 
RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/libssl.so.10
RUN ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/libcrypto.so.10

 

ADD ./start_db.sh /start_db.sh
ADD ./my.cnf.1  /my.cnf.1
ADD ./scaledb.cnf.1 /scaledb.cnf.1

CMD ./start_db.sh

