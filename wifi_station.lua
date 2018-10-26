-- station_cfg.lua
dofile("credentials.lua")


print("Starting wifi server...")

print("station file says IPADR: "..IPADR)

wifi.setmode(wifi.STATIONAP)
wifi.sta.setip({ip=IPADR,netmask="255.255.255.0",gateway=IPROUTER})

station_cfg={}
station_cfg.ssid=SSID
station_cfg.pwd=PASSWORD
station_cfg.save=true
station_cfg.auto=true
wifi.sta.config(station_cfg)
wifi.sta.connect()


print("actual station IP: "..wifi.sta.getip())