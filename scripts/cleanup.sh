#!/bin/bash
echo "Performing cleanup ..."

function check_status {
  local status=$1
  local msg="$2"
  if [ "$status" -ne 0 ]; then
  echo "ERROR - $msg"
  exit $status
  fi
}

## Removing provision & testing tools
echo "Removing ansible ..."
pip uninstall ansible -y
check_status $? "Unable to remove ansible"

echo "Removing inspec ..."
yum -y remove inspec
check_status $? "Unable to remove inspec"

# Cleaning logs
cd /var/log

REMOVELIST="
anaconda*log
cloud-init*.log
dracut.log
node-event-publish.log
ntpstats/loopstats.*
ntpstats/peerstats.*
runlist.log
"
TRUNCATELIST="
audit/audit.log
cron
maillog
messages
ntpstats/loopstats
ntpstats/peerstats
secure
yum.log
"
echo "Cleaning up logs ..."
for fn in $REMOVELIST; do
  /bin/rm -f $fn
  check_status $? "Unable to remove ${fn}"
done

echo "Truncating logs ..."
for fn in $TRUNCATELIST; do
  if [ -f $fn ]; then
  check_status $? "Unable to remove ${fn}"
  fi
done

# clearning the packer scripts directory out of /tmp
echo "Removing packer scripts folder ..."
rm -rf /tmp/scripts
check_status $? "Unable to /tmp/scripts"

echo "Cleaning yum database ..."
# Cleaning yum cache
yum -y clean all
check_status $? "Unable to clean yum database"
