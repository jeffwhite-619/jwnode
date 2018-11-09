-- parse_mqtt_err_reason.lua

dofile("switch.lua")

--mqtt.CONN_FAIL_SERVER_NOT_FOUND         = -5, 
--mqtt.CONN_FAIL_NOT_A_CONNACK_MSG        = -4,
--mqtt.CONN_FAIL_DNS                      = -3,
--mqtt.CONN_FAIL_TIMEOUT_RECEIVING        = -2,  
--mqtt.CONN_FAIL_TIMEOUT_SENDING          = -1, 
--mqtt.CONNACK_ACCEPTED                   = 0,   
--mqtt.CONNACK_REFUSED_PROTOCOL_VER       = 1,  
--mqtt.CONNACK_REFUSED_ID_REJECTED        = 2,   
--mqtt.CONNACK_REFUSED_SERVER_UNAVAILABLE = 3,  
--mqtt.CONNACK_REFUSED_BAD_USER_OR_PASS   = 4,  
--mqtt.CONNACK_REFUSED_NOT_AUTHORIZED     = 5

function parse_err(rc)
    reason_code = 10
    switch(rc) : caseof {
        [mqtt.CONN_FAIL_SERVER_NOT_FOUND] = function() 
            reason_code = "There is no broker listening at the specified IP Address and Port" end,
        [mqtt.CONN_FAIL_NOT_A_CONNACK_MSG] = function()
            reason_code = "The response from the broker was not a CONNACK as required by the protocol" end,
        [mqtt.CONN_FAIL_DNS] = function()
            reason_code = "DNS Lookup failed" end,
        [mqtt.CONN_FAIL_TIMEOUT_RECEIVING] = function()
            reason_code = "Timeout waiting for a CONNACK from the broker" end,
        [mqtt.CONN_FAIL_TIMEOUT_SENDING] = function()
            reason_code = "Timeout trying to send the Connect message" end,
        [mqtt.CONNACK_ACCEPTED] = function()
            reason_code = "No errors. Note: This will not trigger a failure callback." end,
        [mqtt.CONNACK_REFUSED_PROTOCOL_VER] = function()
            reason_code = "The broker is not a 3.1.1 MQTT broker." end,
        [mqtt.CONNACK_REFUSED_ID_REJECTED] = function()
            reason_code = "The specified ClientID was rejected by the broker. (See mqtt.Client())" end,
        [mqtt.CONNACK_REFUSED_SERVER_UNAVAILABLE] = function()
            reason_code = "The server is unavailable." end,
        [mqtt.CONNACK_REFUSED_BAD_USER_OR_PASS] = function()
            reason_code = "The broker refused the specified username or password." end,
        [mqtt.CONNACK_REFUSED_NOT_AUTHORIZED] = function()
            reason_code = "The username is not authorized." end    
    }
    return reason_code
end







