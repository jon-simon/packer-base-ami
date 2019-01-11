#!/bin/bash

## This script should only be used prior to running the packer
## build manually.  When using CI/CD tool, set ENV variables
## in the tool.

for a in {'AWS_PROFILE','AWS_REGION','AMI_PREFIX','AMI_NAME','BUILD_REGION'}; do echo $a? && read res && export $a=$res; done

