#!/bin/bash


sudo docker rm -f cas1


SID1=`sudo docker run -t -P  -d -i --name cas1  -p 4306   michaelfitz/myscaledb:106`
