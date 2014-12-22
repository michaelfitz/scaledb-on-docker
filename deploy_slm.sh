#!/bin/bash



sudo docker build -t="michaelfitz/myslm:106" SLM/.


sudo docker rm -f slm1


SIDS=`sudo docker run -t -d -i  --name slm11 --link cas11:cas11 -p 4306:4306 michaelfitz/myslm:106`



