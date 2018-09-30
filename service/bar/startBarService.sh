#!/bin/bash
set -x

logFile=/opt/service/bar/logs/initBarServicelogs
logmsg()
{
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 " >>$logFile
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 "
}

mkdir -p /opt/service/bar/logs/
chown -R foo:foo /opt/service/
# run script as background daemon
nohup /opt/service/bar/barService.sh 0<&- &>/dev/null &
if [ $? != 0 ]; then
	logmsg "Failed to start bar"
	exit 1
else
	echo $! > /opt/service/bar/bar.pid
	logmsg "Successfully started bar :pid : `cat /opt/service/bar/bar.pid`"
fi
