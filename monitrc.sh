# check process apache with pidfile/i
  check process edge with pidfile /var/run/edge.pid
    start program = "/etc/init.d/edge start" with timeout 60 seconds
    stop program = "/etc/init.d/edge stop"

###

# check process apache with pidfile/i
  check process netvoxMqttBridgeAdapter with pidfile /var/run/netvoxMqttBridgeAdapter.pid
    start program = "/etc/init.d/netvoxMqttBridgeAdapter start" with timeout 60 seconds
    stop program = "/etc/init.d/netvoxMqttBridgeAdapter stop"
    depends on edge

# check process apache with pidfile/i
  check process ellenexMqttBridgeAdapter with pidfile /var/run/ellenexMqttBridgeAdapter.pid
    start program = "/etc/init.d/ellenexMqttBridgeAdapter start" with timeout 60 seconds
    stop program = "/etc/init.d/ellenexMqttBridgeAdapter stop"
    depends on edge