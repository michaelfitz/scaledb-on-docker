#!/bin/bash



sudo docker rm -f slm1


SIDS=`sudo docker run -t -d -i  --name slm1  -p 4306 michaelfitz/myslm:106`
