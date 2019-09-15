#!/bin/bash

#Copy binary to /usr/local/bin
mv netvoxMqttBridgeAdapter /usr/bin

#Ensure binary is executable
chmod +x /usr/bin/netvoxMqttBridgeAdapter

#Set up init.d resources so that netvoxMqttBridgeAdapter is started when the gateway starts
mv netvoxMqttBridgeAdapter.initd /etc/init.d/netvoxMqttBridgeAdapter
mv netvoxMqttBridgeAdapter.default /etc/default/netvoxMqttBridgeAdapter

#Ensure init.d script is executable
chmod +x /etc/init.d/netvoxMqttBridgeAdapter

# #Add adapter to log rotate
# cat << EOF > /etc/logrotate.d/mqttBridgeAdapter.conf
# /var/log/mqttBridgeAdapter {
#     size 10M
#     rotate 3
#     compress
#     copytruncate
#     missingok
# }
# EOF

# #Remove mqttBridgeAdapter from monit in case it was already there
# sed -i '/mqttBridgeAdapter.pid/{N;N;N;N;d}' /etc/monitrc

# #Add the adapter to monit
# sed -i '/#  check process apache with pidfile/i \
#   check process mqttBridgeAdapter with pidfile \/var\/run\/mqttBridgeAdapter.pid \
#     start program = "\/etc\/init.d\/mqttBridgeAdapter start" with timeout 60 seconds \
#     stop program  = "\/etc\/init.d\/mqttBridgeAdapter stop" \
#  ' /etc/monitrc

#reload monit config
monit reload

#Start the adapter
monit start netvoxMqttBridgeAdapter

echo "netvoxMqttBridgeAdapter Deployed"
