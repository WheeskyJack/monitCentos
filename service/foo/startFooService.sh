#!/bin/bash
set -x

logFile=/opt/service/foo/logs/initFooServicelogs
logmsg()
{
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 " >>$logFile
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 "
}

mkdir -p /opt/service/foo/logs/
chown -R foo:foo /opt/service/
nohup /opt/service/foo/fooService.sh 0<&- &>/dev/null &
if [ $? != 0 ]; then
	logmsg "Failed to start foo"
	exit 1
else
	echo $! > /opt/service/foo/foo.pid
	logmsg "Successfully started foo :pid : `cat /opt/service/foo/foo.pid`"
fi
