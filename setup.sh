#!/bin/bash

# Install a basic Node setup
#
# Author: David White
# Created: 1 April 2013 
clear
echo -e '\E[0;35m'"\033[1m    _   __          __ \033[0m"'\E[0;33m'"\033[1m    _____      __            \033[0m"'\E[0;36m'"\033[1m  _____           _       __  \033[0m"
echo -e '\E[0;35m'"\033[1m   / | / /___  ____/ /__\033[0m"'\E[0;33m'"\033[1m  / ___/___  / /___  ______ \033[0m"'\E[0;36m'"\033[1m / ___/__________(_)___  / /_ \033[0m"
echo -e '\E[0;35m'"\033[1m  /  |/ / __ \/ __  / _ \\\\\033[0m"'\E[0;33m'"\033[1m \__ \/ _ \/ __/ / / / __ \\\\\033[0m"'\E[0;36m'"\033[1m \__ \/ ___/ ___/ / __ \/ __/\033[0m"
echo -e '\E[0;35m'"\033[1m / /|  / /_/ / /_/ /  __/\033[0m"'\E[0;33m'"\033[1m___/ /  __/ /_/ /_/ / /_/ /\033[0m"'\E[0;36m'"\033[1m___/ / /__/ /  / / /_/ / /_   \033[0m"
echo -e '\E[0;35m'"\033[1m/_/ |_/\____/\__,_/\___/\033[0m"'\E[0;33m'"\033[1m/____/\___/\__/\__,_/ .___/\033[0m"'\E[0;36m'"\033[1m/____/\___/_/  /_/ .___/\__/   \033[0m"
echo -e '\E[0;32m'"\033[1m Node, RabbitMq and Mongo stack            \033[0m"'\E[0;33m'"\033[1m/_/      \033[0m"'\E[0;36m'"\033[1m               /_/            \033[0m"
echo 
echo


############################################################################### 
# check the currently running user                                            #
###############################################################################
echo -e '\E[1;33m'"\033[1m Checking script user... \033[0m"
if [[ $EUID -ne 0 ]];
    then
        echo -e '\E[1;31m'"\033[1m You must be root to run this script!!! \033[0m"
        exit $?
fi
echo -e '\E[1;36m'"\033[1m Hello, $USER, how are you today? \033[0m"
###############################################################################
# update apt-get
###############################################################################
echo -e '\E[0;35m'"\033[1m Attempting to update the Super Cow Powers! \033[0m"
apt-get -qq -y update
if [ $? -ne 0 ];
    then 
        echo -e '\E[0;41m'"\033[1m Could not update the Super Cow Powers!!! \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Updated the Super Cow Powers! \033[0m"
############################################################################### 
# Install build-essential
###############################################################################  
echo -e '\E[0;35m'"\033[1m Attempting to install build-essential \033[0m"
apt-get -qq -y install build-essential
if [ $? -ne 0 ];
    then 
        echo -e '\E[0;41m'"\033[1m Could not install build-essential \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed build-essential \033[0m"
############################################################################### 
# Install g++
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install g++ \033[0m"
apt-get -y -qq install g++ 
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not install g++ \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed g++ \033[0m"
############################################################################### 
# Install curl
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install curl \033[0m"
apt-get -y -qq install curl 
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not install curl \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed curl \033[0m"
############################################################################### 
# Install libssl-dev
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install libssl-dev \033[0m"
apt-get -y -qq install libssl-dev 
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not install libssl-dev \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed libssl-dev \033[0m"
############################################################################### 
# Install apache2-utils
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install apache-utils \033[0m"
apt-get -qq -y install apache2-utils
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not install apache2-utils \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed apache2-utils \033[0m"
############################################################################### 
# Install erlang-nox
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install erlang-nox \033[0m"
apt-get -y -qq install erlang-nox
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not install erlang-nox \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed erlang-nox \033[0m"
############################################################################### 
# install mongodb
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install mongodb \033[0m"
sudo apt-get -y -qq install mongodb
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not install mongodb \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed mongodb \033[0m"
############################################################################### 
# install node
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install node.js \033[0m"
############################################################################### 
# Change to the /tmp directory
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to change to the /tmp directory \033[0m"
cd /tmp
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not change to the /tmp directory \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Changed to the /tmp directory \033[0m"
############################################################################### 
# Make 'node' directory
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to  make the 'node' directory \033[0m"
mkdir node
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not make 'node' directory \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Made to the 'node' directory \033[0m"
############################################################################### 
# Change to the 'node' directory
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to change to the 'node' directory \033[0m"
cd node
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not change to the 'node' directory \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Changed to the 'node' directory \033[0m"
############################################################################### 
# Download the node source code from node.js
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to download node-v0.10.3.tar.gz from nodejs.org \033[0m"
wget nodejs.org/dist/v0.10.3/node-v0.10.3.tar.gz
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not download the node source code \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Downloaded the node source code \033[0m"
############################################################################### 
# Untar the node source code
############################################################################### 
echo -e '\E[0;35m'"\033[1m Untarring node-v0.10.3.tar.gz \033[0m"
tar -xzf node-v0.10.3.tar.gz
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not untar the node source code \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Untarred the node source code \033[0m"
############################################################################### 
# Change to the untarred source code directory
############################################################################### 
echo -e '\E[0;35m'"\033[1m Changing to node-v0.10.3 directory \033[0m"
cd node-v0.10.3
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not change to the source code directory \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Changed to the source code directory \033[0m"
############################################################################### 
# Running ./configuregranta
############################################################################### 
echo -e '\E[0;35m'"\033[1m Running configure \033[0m"
./configure

############################################################################### 
# Running make
############################################################################### 
echo -e '\E[0;35m'"\033[1m Running make \033[0m"
make

############################################################################### 
# Running make install
############################################################################### 
echo -e '\E[0;35m'"\033[1m Running make install \033[0m"
make install
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not make install \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Successfully installed node \033[0m"
############################################################################### 
# Installing RabbitMQ server
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to install RabbitMQ Server \033[0m"
############################################################################### 
# Change to the /tmp directory
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to change to the /tmp directory \033[0m"
cd /tmp
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not change to the /tmp directory \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Changed to the /tmp directory \033[0m"

############################################################################### 
# Make the rabbitmq directory
############################################################################### 
mkdir rabbitmq

############################################################################### 
# Change to the rabbitmq directory
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to change to the 'rabbitmq' directory \033[0m"
cd rabbitmq
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not change to the 'rabbitmq' directory \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Changed to the 'rabbitmq' directory \033[0m"
############################################################################### 
# Download the RabbitMQ Server
############################################################################### 
echo -e '\E[0;35m'"\033[1m Attempting to download the rabbitmq-server deb package \033[0m"
wget www.rabbitmq.com/releases/rabbitmq-server/v3.0.4/rabbitmq-server_3.0.4-1_all.deb
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not download the RabbitMQ Server \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Downloaded the RabbitMQ Server \033[0m"
############################################################################### 
# Install the RabbitMQ Server
###############################################################################
echo -e '\E[0;35m'"\033[1m Attempting to install the rabbitmq-server deb \033[0m" 
dpkg --install rabbitmq-server_3.0.4-1_all.deb
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not install the RabbitMQ Server \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Installed the RabbitMQ Server \033[0m"
############################################################################### 
# Enable the RabbitMQ Management plugin
###############################################################################
echo -e '\E[0;35m'"\033[1m Attempting to enable the rabbitmq_management plugin \033[0m" 
rabbitmq-plugins enable rabbitmq_management
if [ $? -ne 0 ]; 
    then
        echo -e '\E[0;41m'"\033[1m Could not enable the rabbitmq_management plugin \033[0m"
        exit $?
fi
echo -e '\E[1;32m'"\033[1m Enable the rabbitmq_management plugin \033[0m"
############################################################################### 
# Restart RabbitMQ
###############################################################################
service rabbitmq-server restart