#!/bin/bash

CONFIG_FILE=/etc/ssh/ssh_config

## Adding additional settings to ssh_config to satisfy dev-sec ssh hardening compliance
echo "Setting additional ssh_config settings to satisfy compliance checks"
echo "" | tee $CONFIG_FILE
echo "RhostsRSAAuthentication no" | tee $CONFIG_FILE
echo "RSAAuthentication yes" | tee $CONFIG_FILE
echo "UseRoaming no" | tee $CONFIG_FILE
