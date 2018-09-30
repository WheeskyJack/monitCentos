#!/bin/bash
set -x

logFile=/opt/service/foo/logs/stopFooServicelog
logmsg()
{
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 " >> $logFile
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 "
}

function stopFoo(){
	cat /opt/service/foo/foo.pid | xargs kill -9 2>&1
	if [ $? != 0 ]; then
		logmsg "Failed to stop foo"
	else
		logmsg "Successfully stopped foo"
	fi
}

logmsg "Stopping foo service : pid : `cat /opt/service/foo/foo.pid`"
stopFoo >> $logFile
