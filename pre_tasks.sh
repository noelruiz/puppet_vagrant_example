#!/bin/bash
#                   _            _
#  _ __  _ __ ___  | |_ __ _ ___| | _____
# | '_ \| '__/ _ \ | __/ _` / __| |/ / __|
# | |_) | | |  __/ | || (_| \__ \   <\__ \
# | .__/|_|  \___|  \__\__,_|___/_|\_\___/
# |_|
#
#cleanup old code
# rm -rf /etc/puppet/modules/* > /tmp/environment.log
# check OS and install a few needed packages via shell script as example
if [ -f /etc/debian_version ]; then
  sudo apt-get -y update > /tmp/environment.log
  sudo apt-get -y install wget > /tmp/environment.log
  sudo apt-get -y install vim > /tmp/environment.log
elif [ -f /etc/redhat-release ]; then
  sudo yum -y install wget >> /tmp/environment.log
  sudo yum -y install vim >> /tmp/environment.log
  sudo yum -y install telnet >> /tmp/environment.log
  #sudo yum -y install java >> /tmp/environment.log
fi
