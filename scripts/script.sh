##########
#!/bin/bash
# Docker App setup 

present=`pwd`
echo "update your existing list of packages"
sudo apt update

echo "few prerequisite packages which let apt use packages over HTTPS"
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

echo "then add the GPG key for the official Docker repository"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Add the Docker repository to APT sources"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

echo "Then again update your existing list of packages"
sudo apt update

echo "install from the Docker repo instead of the default Ubuntu repo"
apt-cache policy docker-ce

echo "Finally install Docker"
sudo apt install docker-ce -y 

status=$?
echo "exit status $status"
if [ $status != 0 ]
then
	exit $status
fi

echo "Check the Docker Services"
sudo systemctl status docker
sudo systemctl enable  docker

echo "Check the Docker Version"
docker --version 

echo "Run the ngnix Container t"
docker pull nginx
sleep 3

docker images 
docker run -it -d --name knab-nginx  -p 80:80 f6d0b4767a6c
sleep 3
docker ps  >> abc.txt 

#########
