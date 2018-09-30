#!/bin/bash
logFile=/opt/service/foo/logs/fooServicelogs
logmsg()
{
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 " >>$logFile
	echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 "
}

logmsg "starting boring foo service"
for i in {1..30};do
	logmsg "$i attempt : $i is boring"
	sleep 1
done
logmsg "This is so boring...I am leaving"
exit 1
