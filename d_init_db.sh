#!/bin/bash


sudo docker rm -f db1 


sudo docker run -t -d -i  --name db1   -p 3306:3306 michaelfitz/mydb:106
