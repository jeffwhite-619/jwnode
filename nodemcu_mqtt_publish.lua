-- nodemcu_mqtt.lua

dofile("credentials.lua")

print("MQTT Broker coming online...")

-- simulate telemetry data
-- TODO: real data logic in different file, replace this with dofile
temperature = math.random(100)
pressure = math.random(100)

print("Temperature: "..temperature)
print ("Pressure: "..pressure)
sensor_topic = "sensors"

sensor_data = {
    ["temperature"] = temperature,
    ["pressure"] = pressure
}

sensor_topics = {
    ["temperature"] = sensor_topic,
    ["pressure"] = "decibels"
}

current_published_sensor = ""
current_published_value = nil

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

function publish(sensor_type, topic)
    sensor_topic = topic or sensor_topic
    m:publish("/"..sensor_topic.."/"..CLIENTID.."/"..sensor_type,sensor_data[sensor_type],2,0,update_last_published)
end

function publish_data()
    for k,v in pairs(sensor_data) do
        current_published_sensor = k
        current_published_value = v
        publish(k, sensor_topics[k])
        tmr.delay(10000)
    end
end

function update_last_published(conn)
    local sensor = (sensor_topic:gsub("^%l", string.upper))
    -- FIXME: bug where last_published_* is repeating twice, value is changing and only the last last value is set
    print(sensor.." data published: "..current_published_sensor.." : "..current_published_value)
    if next(sensor_data,_) == nil then
        -- defer this action until all the othes have completed
        print("last publish")
        publish_end()
    else
        print("still more to publish")
    end
    last_published_sensor = current_published_sensor
    last_published_value = current_published_value
end

function publish_end()
    dofile("disconnect_mqtt.lua")
end

m:lwt("/"..sensor_topic.."/errors", "I died. This is my last will and testament and I give nothing to no one, the world owes me! Ha!", 2)

-- broker addr, broker port, secure, (do not use autoreconnect option!), connection callback, connection error callback
m:connect(BROKER, BRPORT, mqtt_connect, handle_mqtt_conn_error)

-- these lines will override the callbacks passed to connect()
--m:on("connect", function(conn) print("Broker connected: "..BROKER) end)
--m:on("offline", function(conn) print("Broker disconnected: "..BROKER) end)






