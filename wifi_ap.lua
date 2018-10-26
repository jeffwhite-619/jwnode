-- ap_cfg.lua
dofile("credentials.lua")


print("Starting wifi access point...")

ap_cfg={}
ap_cfg.ssid="node-one"
ap_cfg.pwd="!1@2#3$4%5^6&7*8(9)0"
ap_cfg.auth=wifi.WPA_WPA2_PSK
ap_cfg.save=true
ap_cfg.staconnected_cb=function(mac,aid)
    print("AP Client connected. MAC: "..mac.." | AID: "..aid.."\r\n")
end
ap_cfg.stadisconnected_cb=function(mac,aid)
    print("AP Client disconnected. MAC: "..mac.." | AID: "..aid.."\r\n")
end
ap_cfg.probereq_cb=function(mac,rssi)
    print("AP Client probing... MAC: "..mac.." | RSSI (Received Signal Strength Ind.) : "..rssi.."\r\n")
end

wifi.ap.config(ap_cfg)
wifi.ap.setip({ip=NODEIPADR,netmask="255.255.255.0",gateway=NODEIPROUTER})

dhcp_config ={}
dhcp_config.start = "192.168.1.100"
wifi.ap.dhcp.config(dhcp_config)
wifi.ap.dhcp.start()

