-- credentials.lua

SSID = ""
PASSWORD = ""
CLIENTID = "ESP8266-"..node.chipid()
IPADR = "192.168.1.15" -- Requested static IP address for the ESP
IPROUTER = "192.168.0.1" -- IP address for the Wifi router
NODEIPADR = "192.168.1.5" -- private IP for node's wifi AP
NODEIPROUTER = "192.168.1.1"

-- values for MQTT broker
BROKER = "BROKER" -- BROKER SERVER (e.g., z99.cloudmqtt.com)
BUSER = "BROKER USER"
BRPORT = 11111 -- BROKER PORT
SSLPORT = 22222
BRPWD = "BROKER PASSWORD"