#!/bin/bash

# Start Monit
monit -I -c /etc/monitrc &

# this infinite loop will keep script running forever
while [ 1 ] ; do
   sleep 1d
done
