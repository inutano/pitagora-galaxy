#!/bin/bash

# For EC2: add hostname to /etc/hostname to avoid warnings on sudo
sudo sh -c 'echo 127.0.1.1 $(hostname) >> /etc/hosts'

# INSTALLING OS PACKAGES
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | sudo tee -a /etc/apt/sources.list.d/docker.list
sudo apt-get update -y && sudo apt-get install -y \
  sysv-rc-conf \
  gcc \
  make \
  libsqlite3-dev \
  libncurses5-dev \
  zlib1g-dev \
  libbz2-dev \
  libssl-dev \
  mysql-server \
  libmysqlclient-dev \
  apache2 \
  vsftpd \
  acpid \
  linux-image-extra-$(uname -r) \
  docker-engine \
  default-jdk \
  gfortran \
  g++

# Add user 'ubuntu' to group 'docker'
sudo usermod -aG docker "${USER}"

# INSTALLING PYTHON
mkdir -p "${HOME}/galaxy-python/install"
cd "${HOME}/galaxy-python"
wget "http://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz"
tar xvzf Python-2.7.11.tgz
cd Python-2.7.11
./configure --prefix="${HOME}/galaxy-python/install"
make
make install

# SETTING ENVIRONMENTAL VARIABLES
echo 'export PATH=${HOME}/galaxy-python/install/bin:${PATH}' >> "${HOME}/.profile"
echo 'export PYTHONPATH=${HOME}/galaxy-python/install/lib/python2.7/site-packages' >> "${HOME}/.profile"
export PATH=${HOME}/galaxy-python/install/bin:$PATH
export PYTHONPATH=${HOME}/galaxy-python/install/lib/python2.7/site-packages
python --version

# INSTALLING GALAXY
cd
git clone -b release_17.05 https://github.com/galaxyproject/galaxy.git
cd galaxy
./run.sh
