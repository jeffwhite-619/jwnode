-- dio.lua

LED = 8
state = 0

gpio.mode(LED, gpio.OUTPUT)


function toggle_output(pin)
    if 0 == state then
        gpio.write(LED, gpio.HIGH)
    else
        gpio.write(LED, gpio.LOW)
    end

    state = (state + 1)%2
end


tmr.alarm(0, 1000, 1, function() toggle_output(LED) end )

print("LED connected to Pin8 will be toggled every second")
print("Stop this by tmr.stop(0)")