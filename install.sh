#!/bin/bash
set -e
set -x
#addding user
adduser foo
mv /bd_build/service /opt/
chown -R foo:foo /opt/service/
