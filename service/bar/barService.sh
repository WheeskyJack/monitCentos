#!/bin/bash
set -x

logFile=/opt/service/bar/logs/barServiceLog
logmsg()
{
  echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 " >> $logFile
  echo -e "`date \"+%y/%m/%d %H:%M:%S\"`: $1 "
}

logmsg "start of exciting bar service"
for i in {1..15};do
	logmsg "attempt: $i : $i number is exciting"
	sleep 1s
done
logmsg "goodbye..? oh no, please..Can't we go back to page one and do it all over again?"
exit 1
