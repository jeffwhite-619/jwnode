# jwnode
NodeMCU, Lua, HC-05 Bluetooth LE

Exploring NodeMCU (ESP8266, ESP-12E), Lua, and HC-05 Bluetooth transceiver module

I did most of the work on Linux Ubuntu 18.04. The flash program is designed for Windows and did not work correctly with WINE.

To get started you will need to do or acquire the following:

1.  Acquire a NodeMCU V1.0, preferably the Amica variety. Other manufacturers have a different pin layout, so you'll need to
    figure out what that is if you choose a different OEM. Amica is "officially supported" by the way. No matter what the
    OEM, the boards are typically around $5-10 USD.
2.  Acquire an HC-05 Bluetooth module. These are typically around $4 USD.
3.  Setup a free account at https://www.cloudmqtt.com/. The free tier is called Cute Cat.
4.  Download and install the NodeMCU Firmware Flasher. The github project is called nodemcu-flasher and you can get it here
    https://github.com/nodemcu/nodemcu-flasher. It's designed for Windows and so I used it on Windows. I can't really testify     whether it works well on Linux, as I was not setting the jumper correctly at the time. More on that later...
5.  Download and install esplorer https://github.com/4refr0nt/ESPlorer
6.  Know your docs. For help you'll want to look in the following places:
    - For NodeMCU, go to https://nodemcu.readthedocs.io/en/latest/
    - For Lua, http://lua-users.org/ has been the most helpful to me
    - CloudMQTT has an API with docs at https://docs.cloudmqtt.com/
    - For specifically joining NodeMCU and HC-05 I went here (in fact this project is largely based on this link)
     https://www.electronicwings.com/nodemcu/hc-05-bluetooth-module-interfacing-with-nodemcu
    - Learn to read schematics here https://learn.sparkfun.com/tutorials/how-to-read-a-schematic/all
7.  A 5V power source that you can wire up to the HC-05. For me the easiest thing was an Arduino Uno board.
8.  You'll also need some basic prototyping tools, like wires, a 330 ohm resistor, an LED, and a breadboard.
9.  Download and install BT Terminal on your smartphone. I use an Android phone. As you might guess, the BT in BT Terminal
    stands for BlueTooth.
10. Go to https://nodemcu-build.com/ and select the following modules for your firmware build:
    Bloom filter, crypto, CoAp, file, GPIO, I2C, net, node, timer, UART, WiFi, MQTT, SPI, SJSON, websocket
    (Disclaimer: I don't use all these modules, but I plan to. If you are doing something different with this project, you
    can choose which modules you need; the build site has tooltips for each module explaining what it is, and each module is
    documented well in the resouce listed above.)
    - Also be sure to choose TSL/SSL, but no debug. Debug will take up a large amount of resources on the chip.
    - Branch should be the master branch. 
    - Enter an email to receive the build and then wait for your custom build to be built. 
     

There are a number of other tools I could have used, but didn't. They are:
- esptool
- luatool
- Arduino (for writing code, I still use it for powering the HC-05)
- MicroPython
- any of the other ESP8266 boards (ESP-1, etc)
- MQTTfx, or node-red, or a number of other programs capable of brokering mqtt transmissions

I also recommend getting more than one NodeMCU and HC-05 module, as the likelihood of getting 2 bad chips is pretty slim. Out of 4 NodeMCUs I purchased, one was toast.
