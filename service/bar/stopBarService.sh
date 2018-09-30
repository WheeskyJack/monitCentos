#!/bin/bash
set -x

logFile=/opt/service/bar/logs/stopFooServicelog
logmsg()
{
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 " >> $logFile
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 "
}

function stopFoo(){
	cat /opt/service/bar/bar.pid | xargs kill -9 2>&1
	if [ $? != 0 ]; then
		logmsg "Failed to stop bar"
	else
		logmsg "Successfully stopped bar"
	fi
}

logmsg "Stopping bar service : pid : `cat /opt/service/bar/bar.pid`"
stopFoo >> $logFile
