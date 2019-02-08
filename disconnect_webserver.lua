-- disconnect_webserver.lua

srv = srv or net.createServer(net.TCP)
srv:close()