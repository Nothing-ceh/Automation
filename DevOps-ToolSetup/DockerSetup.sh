#!/bin/bash

#################################################################
#"/This Script helpb you to install and setup  Docker"

#First update our linux repository"
sudo apt-get upgrade -y && sudo apt-get update

#Install Prerequisite Packages

sudo apt-get install curl apt-transport-https ca-certificates software-properties-common

#Add the Docker Repositories
## First, we add the GPG key, by entering the following command in the command line:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Next, we add the repository:

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#After that, just update the repository information:
sudo apt update
#Make sure you are installing from the Docker repo instead of the default Ubuntu repo with this command:

apt-cache policy docker-ce

#Install Docker on Ubuntu 18.04

sudo apt install docker-ce -y

#Check Docker Status
sudo systemctl status docker

#Check docekr version

docker-version
# To avoid this error
#Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: 
#Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json?all=1": dial unix /var/run/docker.sock: connect: permission denied

sudo chmod 666 /var/run/docker.sock
sudo usermod -aG docker ${USER}

#Test docker properly working or not 
sudo docker run hello-world

<< 'MULTILINE-COMMENT'
# Searching any image or conatiner via this command
  sudo docker search [search_query]
  >> exampl: sudo docker search ubuntu

# Downloads or pull images or conatiner
     sudo docker pull [image_name]
     >> example: sudo docker pull ubuntu

 #chacking images on your system 
  sudo docker images

#we can execute our image using the pull command and the Image ID.
or Install/ creater conatiner 
    sudo docker run -i -t [image]
    >> example: docker run -i -t ubuntu
#if we want to use Docker without root privileges, we need to run the following command:
    sudo usermod -aG docker $(whoami)

#To view the options available with a command:
    docker docker-subcommand --help
MULTILINE-COMMENT