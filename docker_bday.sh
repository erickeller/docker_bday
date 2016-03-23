#!/bin/sh
# set source list to swizerland
sudo sh -c "sed -i 's/us.archive/ch.archive/g' /etc/apt/sources.list"

# add required packages
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates
# add docker key
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# add docker source list
cat << EOF > /etc/apt/sources.list.d/docker.list
deb https://apt.dockerproject.org/repo ubuntu-wily main
EOF
# update and upgrade
sudo apt-get update && sudo apt-get dist-upgrade -y
# install docker
sudo apt-get purge -y lxc-docker
sudo apt-get install -y docker-engine
# install docker-compose from github
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

# create a docker group
sudo usermod -aG docker vagrant
# pull docker images
BASE_IMAGES="docker pull hello-world
docker pull alpine
docker pull seqvence/static-site
docker pull mhart/alpine-node
docker pull python:2.7-alpine
docker pull manomarks/worker
docker pull redis:alpine
docker pull postgres:9.4"

for bi in ${BASE_IMAGES}
do
    sudo docker pull ${bi}
done
