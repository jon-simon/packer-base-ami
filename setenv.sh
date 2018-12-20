#!/bin/bash

## This script should only be used prior to running the packer
## build manually.  When using CI/CD tool, set ENV variables
## in the tool.

export AWS_PROFILE=default
export AWS_REGION=us-west-2
export AMI_PREFIX='jibakurei'
export AMI_NAME='amzn2-base'
# export SHARE_ACCOUNTS=
export BUILD_REGION='us-west-2'
