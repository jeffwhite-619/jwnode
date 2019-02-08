-- disconnect_mqtt.lua

m = m or mqtt.Client(CLIENTID, 120, BRUSER, BRPWD)
print "MQTT client closing connection"
closed = m:close()
if closed then
    print("MQTT client closed")
else
    print("MQTT client is not open")
end
