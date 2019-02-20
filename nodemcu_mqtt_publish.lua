-- nodemcu_mqtt.lua

dofile("credentials.lua")

print("MQTT Broker coming online...")

-- simulate telemetry data
-- TODO: real data logic in different file, replace this with dofile

--temperature = math.random(100)
-- pressure = math.random(100)

dofile("nodemcu_dht_read.lua")

print("Temperature: "..temp)
print ("Humidity: "..humi)
sensor_topic = "sensors"

sensor_data = {
    ["temperature"] = temp,
    ["humidity"] = humi,
    nil
}

sensor_topics = {
    ["temperature"] = sensor_topic,
    ["humidity"] = "humidity",
    nil
}

-- client id, keepalive, user, pwd, cleansession default = 1
m = mqtt.Client(CLIENTID, 120, BRUSER, BRPWD)
print("MQTT client created")

function mqtt_connect(conn)
    print("Broker online: "..BROKER..":"..BRPORT.." as "..CLIENTID)
    publish_data()
end

function handle_mqtt_conn_error(conn, reason)
    print("Connection failed: "..reason)
    dofile("parse_mqtt_err_reason.lua")
    print(parse_err(reason))
    publish_end()
end

function publish(sensor_type, topic, qos)
    sensor_topic = topic or sensor_topic
    local sensor = (sensor_topic:gsub("^%l", string.upper))
    published = m:publish("/"..sensor_topic.."/"..CLIENTID.."/"..sensor_type,sensor_data[sensor_type],qos,0,published)
    print(sensor.." data published: "..sensor_type.." : "..sensor_data[sensor_type])
end

function publish_data()
    local k,v = next(sensor_data,nil)
    while k do
        publish(k, sensor_topics[k], 2)
        tmr.delay(10000)
        k,v = next(sensor_data,k)
    end
end

function published(conn)
    print("Published!")
end

function publish_end()
    dofile("disconnect_mqtt.lua")
end

m:lwt("/"..sensor_topic.."/errors", "I died.", 2)

-- broker addr, broker port, secure, (do not use autoreconnect option!), connection callback, connection error callback
m:connect(BROKER, BRPORT, mqtt_connect, handle_mqtt_conn_error)

-- these lines will override the callbacks passed to connect()
--m:on("connect", function(conn) print("Broker connected: "..BROKER) end)
--m:on("offline", function(conn) print("Broker disconnected: "..BROKER) end)
