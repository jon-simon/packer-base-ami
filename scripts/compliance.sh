#!/bin/bash

# # Installing InSpec
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec # -v 3.0.25

# # Run inspec linux-baseline tests
# inspec exec https://github.com/dev-sec/linux-baseline --no-distinct-exit ## need to add this flag to handle 'skipped' tests.

# # Run inspec ssh-baseline tests
# inspec exec https://github.com/dev-sec/ssh-baseline --no-distinct-exit ## need to add this flag to handle 'skipped' tests.

echo "***************************************************************************"
echo "Skipping DEV/SEC compliance tests for the moment because"
echo "of issues with inspec detecting Amazon Linux 2 correctly."
echo "This will be solved when inspec/train gem version 1.5.10 becomes available."
echo "***************************************************************************"
