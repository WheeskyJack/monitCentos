#!/bin/bash
set -e
set -x

#adding proxy if behind one
#printf "\nproxy=http://10.144.1.10:8080" >> /etc/yum.conf

yum clean all && rm -rf /var/cache/yum

#yum -y update
#installing epel release rpm to install monit
yum -y install epel-release 
yum -y install monit #installing monit

yum clean all && rm -rf /var/cache/yum
