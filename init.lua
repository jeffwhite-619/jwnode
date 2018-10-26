-- init.lua

dofile("credentials.lua")

function startup()
    if nil == file.open("init.lua") then 
        print("init.lua deleted")
    else
        print("Running")
        file.close("init.lua")
        --file.remove("init.lua")
        --dofile("application.lua")
    end
end

dofile("wifi_servers.lua")

tmr.alarm(1,1000,1,function()
    if nil == wifi.sta.getip() then
        print("Waiting for IP . . .")
    else
        tmr.stop(1)
        print("IP found: "..wifi.sta.getip())
        print('MAC: ',wifi.sta.getmac())
        print('chip: ',node.chipid())
        print('heap: ',node.heap())
        tmr.alarm(0,5000,0,startup)
    end
end)


