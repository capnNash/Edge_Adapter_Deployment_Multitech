#!/bin/bash


#Set up init.d resources so that edge is started when the gateway starts
mv edge.initd /etc/init.d/edge
mv edge.default /etc/default/edge

#Ensure init.d script is executable
chmod +x /etc/init.d/edge

# #Remove edge from monit in case it was already there
# sed -i '/edge.pid/{N;N;N;N;d}' /etc/monitrc

# #Add the edge to monit
# sed -i '/#  check process apache with pidfile/i \
#   check process edge with pidfile \/var\/run\/edge.pid \
#     start program = "\/etc\/init.d\/edge start" with timeout 60 seconds \
#     stop program  = "\/etc\/init.d\/edge stop" \
#  ' /etc/monitrc

#reload monit config
monit reload

#Start the edge
monit start edge

echo "edge Deployed"
