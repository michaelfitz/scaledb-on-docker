sudo docker build -t="michaelfitz/mydb:106" DB/.

sudo docker rm -f db1 


sudo docker run -t -d -i  --name db1  -p 3306:3306 --env-file=deploy_db.env       michaelfitz/mydb:106



