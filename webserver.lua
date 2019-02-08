--  webserver.lua

nodename = "ESP8266 Node-"..node.chipid()

srv=net.createServer(net.TCP)

srv:listen(80,function(conn)
    conn:on("receive", function(conn, payload)
        print("Got query...")
        print("Heap =  "..node.heap().." Bytes")
        print("Time since start = "..tmr.time().." sec")
        -- print("Print payload:\n"..payload)
        reply_begin = "<html><head><title>"..nodename.."</title></head><body><h1>"..nodename.."</h1>"
        reply_end = "</body></html>"

        local protocol=string.sub(payload,7,10)
        
        -- GET / HTTP/1.1 Host: 192.168.1.15 --
        if (protocol == "HTTP") then
            reply = reply_begin.."NodeMCU WiFi Access Point<br>"..payload.."<br>"
        else
            reply = reply_begin.."NOT FOUND: ".."Protocol: "..protocol.."<br>"..payload.."<br>"
        end
        reply = reply..reply_end
        payloadLen = string.len(reply)
        conn:send("HTTP/1.1 200 OK\r\n")
        conn:send("Content-Length:"..tostring(payloadLen).."\r\n")
        conn:send("Connection:close\r\n\r\n")
        conn:send(reply)
        collectgarbage()
    end)

    conn:on("sent",function(conn)
        conn:close()
    end)
end)
        
        
    
