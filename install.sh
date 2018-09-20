#!/bin/bash
set -e
set -x
#addding user
adduser foo
#copying monit config file to etc path so that monit can find it
cp /bd_build/monitrc /etc/monitrc
