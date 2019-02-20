-- dht.lua

DHTpin = 7
-- pin 7 == gpio13
-- pin 8 == gpio15

status, temp, humi, temp_dec, humi_dec = dht.read(DHTpin)
if status == dht.OK then

    if temp > 0x8000 then
        -- convert to negative format
        temp = -(temp - 0x8000)
    end
    -- Integer firmware using this example
    --print(string.format("DHT Temperature:%d.%03d;Humidity:%d.%03d\r\n",
    --      math.floor(temp),
    --      temp_dec,
    --      math.floor(humi),
    --      humi_dec
    --))
    temp = (temp/256)/10
    humi = (humi/256)/10

    temp=(temp*9/5+32)

    --temp = temp/100
    --humi = humi/100

    temp = temp.." Deg C"
    humi = humi.."%"
    -- Float firmware using this example
    print("DHT Temperature:"..temp..";".."Humidity:"..humi)

elseif status == dht.ERROR_CHECKSUM then
    print( "DHT Checksum error." )
elseif status == dht.ERROR_TIMEOUT then
    print( "DHT timed out." )
end

