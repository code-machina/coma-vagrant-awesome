#!/bin/bash

############################################################
## DISCLAIMER by Code-Machine                             ##
## Author: code-machina (gbkim1988@gmail.com)             ##
## Filename: provision.sh                                 ##
## Purpose: Automatically Installing Docker-CE            ##
## Latested Update Date : 2019.08.12                      ##
############################################################

## Dependencies
##  - trusty : ubuntu/trusty64


## !! For instructions, Set Environmental Variable

# it forces for ubuntu NOT to be interactive for the shell connection 
export DEBIAN_FRONTEND=noninteractive

export ASSUMED_USER=vagrant
## The Blow Commands are not for docker-ce, it's for Moby Projects.
# sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 \ --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
# sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
# sudo apt-get install docker-engine --force-yes -y

## !! Docker Installation COMMAND SETs !!

# Step 1. Set up the repository
sudo apt-get update
# Step 2. install dependencies
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common --force-yes -y

# Step 3. Add Docker's Official GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Step 4. Check fingerprint
sudo apt-key fingerprint 0EBFCD88

# Step 5. Set up the stable repository.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Step 6. You are ready to get apt package index
sudo apt-get update

# Step 7. Install the latest version of Docker Engine
#   - For the future, this is not RECOMMENDED for production system.
#   - If U can't buy a Enterprise Liscense of Docker-EE, Just Select a version of docker-ce.

# After I had handled trouble-shooting, I could specify the detailed version info.
# sudo apt-get install docker-ce --force-yes -y # you may meet some trouble shooting point. 
# https://forums.docker.com/t/ubuntu-16-04-docker-run-error-solved/69093
sudo apt-get install docker-ce=18.06.1~ce~3-0~ubuntu --force-yes -y 
## !! User Group Settings

##    I supposed that you're vagrant user. So your default user account name is vagrant.

# Step 1. add User to `docker` group
sudo usermod -aG docker $ASSUMED_USER

# Step 2. Change permissions
if [[ -f "/home/$ASSUMED_USER/.docker" ]]; then
  # Only IF `.docker` directory is already created,
  # This conditional block would be working.
  sudo chown "$ASSUMED_USER":"$ASSUMED_USER" /home/"$ASSUMED_USER"/.docker -R
  sudo chmod g+rwx "$HOME/.docker" -R
fi 

# Step 3. Let's START docker service
sudo service docker start

# Step 4. Check Docker Permissions.
docker version
