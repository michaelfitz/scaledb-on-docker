#!/bin/bash

sudo docker build -t="michaelfitz/myscaledb:106" CAS/.

sudo docker rm -f casp


SID1=`sudo docker run -t  -d -i --name casp  -p 4306:4306 --env-file=deploy_cas.env   michaelfitz/myscaledb:106`






