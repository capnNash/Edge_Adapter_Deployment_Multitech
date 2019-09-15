#!/bin/bash

#Stop the adapter
monit stop netvoxMqttBridgeAdapter

#Remove Adapter from monit
sed -i '/netvoxMqttBridgeAdapter.pid/{N;N;N;N;d}' /etc/monitrc

#Remove the init.d script
rm /etc/init.d/netvoxMqttBridgeAdapter

#Remove the default variables file
rm /etc/default/netvoxMqttBridgeAdapter

#Remove the adapter log file from log rotate
rm /etc/logrotate.d/netvoxMqttBridgeAdapter.conf

#Remove the binary
rm /usr/bin/netvoxMqttBridgeAdapter

#reload monit config
monit reload