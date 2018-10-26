-- nodemcu_info.lua

-- NodeMCU hardware info
majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info()

print("NodeMCU version "..majorVer.."."..minorVer.."."..devVer)
print("\nChipID "..chipid)
print("\nFlashID "..flashid.." Flashsize "..flashsize/1000 .."MB")
print("\nFlashmode "..flashmode.." Flashspeed "..flashspeed/1000000 .."MHz")

-- file info
remaining, used, total = file.fsinfo()
print("\File system info:\nTotal : "..total.." Bytes\nUsed: "..used.." Bytes\nRemain: "..remaining.." Bytes\n")

-- heap
heap_size = node.heap()
print("Remaining heap size: "..heap_size)

-- timer
print("NodeMCU running "..tmr.now()/1000000 .." sec from last restart\n")