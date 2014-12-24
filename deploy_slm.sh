#!/bin/bash



sudo docker build -t="michaelfitz/myslm:106" SLM_NODE/.


sudo docker rm -f slm1


SIDS=`sudo docker run -t -d -i  --name slm1 --env-file=deploy_slm.env -p 4306:4306 michaelfitz/myslm:106`


