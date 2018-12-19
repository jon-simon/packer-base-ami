#!/bin/bash
VERSION=1.2.2

mkdir /opt/cloudwatch_monitoring
cd /opt/cloudwatch_monitoring
curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-${VERSION}.zip -O
unzip CloudWatchMonitoringScripts-${VERSION}.zip
rm CloudWatchMonitoringScripts-${VERSION}.zip
crontab -l | { cat; echo "*/5 * * * * /opt/cloudwatch_monitoring/aws-scripts-mon/mon-put-instance-data.pl --auto-scaling --mem-util --disk-space-util --disk-path=/ --from-cron"; } | crontab -
