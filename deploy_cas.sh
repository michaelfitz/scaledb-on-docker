#!/bin/bash

sudo docker build -t="michaelfitz/myscaledb:106" CAS/.

sudo docker rm -f cas1


SID1=`sudo docker run -t  -d -i --name cas1  -p 4306:4306    michaelfitz/myscaledb:106`






