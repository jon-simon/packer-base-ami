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
WIPELIST="
cron
dmesg
maillog
messages
secure
yum.log
"
echo "Cleaning up logs ..."
for fn in $REMOVELIST; do
  /bin/rm -f $fn
  check_status $? "Unable to remove ${fn}"
done

# clearning the packer scripts directory out of /tmp
echo "Removing packer scripts folder ..."
rm -rf /tmp/scripts
check_status $? "Unable to /tmp/scripts"

echo "Cleaning yum database ..."
# Cleaning yum cache
yum -y clean all
check_status $? "Unable to clean yum database"

echo "Wiping logs ..."
for fn in $TRUNCATELIST; do
  if [ -f $fn ]; then
  echo "" > $fn
  check_status $? "Unable to wipe ${fn}"
  fi
done
