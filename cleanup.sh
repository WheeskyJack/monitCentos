#!/bin/bash
set -e
set -x

find /bd_build/ -not \( -name 'bd_build' -or -name 'buildconfig' -or -name 'cleanup.sh'  -or -name 'startup.sh' -or -name 'monit_stop_all_wait.sh' -or -name 'foo-service.sh' -or -name 'startFooService.sh' -or -name 'monitrc' -or -name 'service'  \) -delete
rm -rf /tmp/* /var/tmp/*
yum clean all && rm -rf /var/cache/yum
## removing proxy from yum.conf
#sed -i -e '/^[[:space:]]*proxy=http:.*10.144.1.10:8080[[:space:]]*$/d' /etc/yum.conf
