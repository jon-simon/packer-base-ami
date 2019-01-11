#!/bin/bash

# Adding epel repo
yum-config-manager --enable epel

# Base packages
PACKAGES="
awslogs
git
initscripts
jq
libpcap-devel
net-tools
perl-DateTime
perl-Digest-SHA.x86_64
perl-LWP-Protocol-https
perl-Switch
perl-Sys-Syslog
python-pip
"

# Looping the through and install the PACKAGES list
for fn in $PACKAGES; do
  yum -y install $fn
done

# Installing Ansible -- this will be removed in the cleanup script
pip install ansible
