#!/bin/bash

# # Installing InSpec
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec                                 ## accepting the new chef license

# Run inspec linux-baseline tests
inspec exec https://github.com/dev-sec/linux-baseline --no-distinct-exit --chef-license=accept-silent ## need to add this flag to handle 'skipped' tests.

# Run inspec ssh-baseline tests
# inspec exec https://github.com/dev-sec/ssh-baseline --no-distinct-exit ## need to add this flag to handle 'skipped' tests.
