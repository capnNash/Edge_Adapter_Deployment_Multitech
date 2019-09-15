#!/bin/bash

#Stop the adapter
monit stop ellenexMqttBridgeAdapter

#Remove Adapter from monit
sed -i '/ellenexMqttBridgeAdapter.pid/{N;N;N;N;d}' /etc/monitrc

#Remove the init.d script
rm /etc/init.d/ellenexMqttBridgeAdapter

#Remove the default variables file
rm /etc/default/ellenexMqttBridgeAdapter

#Remove the adapter log file from log rotate
rm /etc/logrotate.d/ellenexMqttBridgeAdapter.conf

#Remove the binary
rm /usr/bin/ellenexMqttBridgeAdapter

#reload monit config
monit reload