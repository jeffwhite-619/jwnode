-- getAPs.lua
-- show access points

--TODO: string pad the values being printed

function listap(t)
    print("\nAccess Points: ")
    print("SSID              Authmode              RSSI              BSSID              Channel")
    for ssid,v in pairs(t) do
        authmode, rssi, bssid, channel = string.match(v,"(%d),(.?%d+),(%x%x:%x%x:%x%x:%x%x:%x%x:%x%x),(%d+)")
        print(ssid,"\t",authmode,"\t",rssi,"\t",bssid,"\t",channel)
    end
end

wifi.sta.getap(listap)
