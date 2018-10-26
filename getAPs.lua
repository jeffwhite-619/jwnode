-- getAPs.lua
-- show access points

function listap(t)
    print("\nAccess Points: ")
    print("SSID    Authmode    RSSI    BSSID    Channel")
    for ssid,v in pairs(t) do
        authmode, rssi, bssid, channel = string.match(v,"(%d),(-?%d+),(%x%x:%x%x:%x%x:%x%x:%x%x:%x%x:,(%d+)")
        print(ssid,authmode,rssi,bssid,channel)
    end
end

wifi.sta.getap(listap)
