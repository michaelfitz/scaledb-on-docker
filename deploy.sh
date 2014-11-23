#!/bin/bash

sudo docker build -t="michaelfitz/myscaledb:106" CAS/.

sudo docker rm -f cas1 
sudo docker rm -f cas2
sudo docker rm -f casp


SID1=`sudo docker run -t  -d -i --name cas1  -p 4306   michaelfitz/myscaledb:106`

SID2=`sudo docker run -t  -d -i --name cas2   -p 4306   michaelfitz/myscaledb:106`


SIDP=`sudo docker run -t  -d -i --name casp --link cas1:cas1 --link cas2:cas2 -p 4306   michaelfitz/myscaledb:106`


sudo docker build -t="michaelfitz/myslm:106" SLM/.


sudo docker rm -f slm1


SIDS=`sudo docker run -t -d -i  --name slm1 --link casp:casp -p 4306 michaelfitz/myslm:106`



