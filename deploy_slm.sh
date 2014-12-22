#!/bin/bash



sudo docker build -t="michaelfitz/myslm:106" SLM/.


sudo docker rm -f slm1


SIDS=`sudo docker run -t -d -i  --name slm1 --link casp:casp -p 5306:5306 michaelfitz/myslm:106`

/bin/bash

