#!/bin/bash

#Stop the edge
monit stop edge

#Remove xDotAdapter from monit
sed -i '/edge.pid/{N;N;N;N;d}' /etc/monitrc

#Remove the init.d script
rm /etc/init.d/edge

#Remove the default variables file
rm /etc/default/edge

#Remove the adapter log file from log rotate
rm /etc/logrotate.d/edge.conf

#Remove the binary
rm /usr/bin/edge

#reload monit config
monit reload