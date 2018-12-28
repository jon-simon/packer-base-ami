# packer-base-ami

[![CircleCI](https://circleci.com/gh/jon-simon/packer-base-ami.svg?style=svg)](https://circleci.com/gh/jon-simon/packer-base-ami)

## Description
Packer project to build a hardened Amazon Linux 2 base AMI.

## Requirements
Packer (tested with v1.3.1)

## Usage
* Set the following environmental variables

**```AWS_PROFILE```** **```AWS_REGION```** **```AMI_PREFIX```** **```AMI_NAME```** **```BUILD_REGION```**


> NOTE: Here's a bash one liner to quickly set all of the required ENV variables.  Just copy and paste into your terminal then follow the prompts. 

```
for a in {'AWS_PROFILE','AWS_REGION','AMI_PREFIX','AMI_NAME','BUILD_REGION'}; do echo $a? && read res && export $a=$res; done
```

* From the root of the project run ```packer build packer.json```