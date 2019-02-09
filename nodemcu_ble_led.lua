-- nodemcu_ble_led.lua

-- Amica board
LEDpin = 2
gpio.write(LEDpin, gpio.LOW)

print("Writing to pin "..LEDpin)

uart.setup(0, 9600, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)

uart.on("data",1,function(data)
    print("data event")
    if data == "1" then
        print("LED ON")
        dofile("nodemcu_mqtt_publish.lua")
        gpio.write(LEDpin, gpio.HIGH)
    elseif data == "2" then
        print("LED OFF")
        dofile("disconnect_mqtt.lua")
        gpio.write(LEDpin, gpio.LOW)
    else
        print("ERROR") 
    end
end, 0)
