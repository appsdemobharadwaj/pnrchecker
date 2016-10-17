sudo docker kill $(sudo docker ps -q -f ancestor="bharadwajsnp/dockerized-war:latest")
sudo docker rm $(sudo docker ps -a -q -f ancestor="bharadwajsnp/dockerized-war:latest")
sudo docker rmi bharadwajsnp/dockerized-war:latest
