-- nodemcu_ble_led.lua

LEDpin = 4
gpio.mode(LEDpin, gpio.OUTPUT)
gpio.write(LEDpin, gpio.LOW)


uart.setup(0, 9600, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)

uart.on("data",1,
function(data)
    print(data)
    if(data == "1") then
        print("LED ON")
        gpio.write(LEDpin, gpio.HIGH)
    elseif(data == "2") then
        print("LED OFF")
        gpio.write(LEDpin, gpio.LOW)
    else
        print("ERROR") 
    end
end, 0)