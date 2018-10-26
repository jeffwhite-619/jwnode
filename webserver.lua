--  webserver.lua


srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(conn, payload)
        print("Got query...")
        print("Heap =  "..node.heap().." Bytes")
        print("Time since start = "..tmr.time().." sec")
        -- print("Print payload:\n"..payload)
        reply_begin = "<html><head><title>ESP8266 Node-"..node.chipid().."</title></head><body></body></html>"
        reply_end = "</body></html>"


        -- 1234567089012
        -- GET /HC-05 HTTP/1.1 --
        command = string.sub(payload,6,10)
        if ("HC-05" == command) then
            -- run the application
            reply = reply_begin.."HC-05 Bluetooth NodeMCU Smart Beacon"..reply_end
        else
            reply = reply_begin.."HC-05 Bluetooth NodeMCU Smart Beacon"..reply_end
        end
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
        
        
    