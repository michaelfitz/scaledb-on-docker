sudo docker build -t="michaelfitz/mydb:106" DB/.

sudo docker rm -f db1 


sudo docker run -t -d -i  --name db1  --link casp:casp -p 3306:3306 michaelfitz/mydb:106



