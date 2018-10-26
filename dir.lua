-- dir.lua
-- list files on NodeMCU

print("Files on "..SSID)
l = file.list()
for k,v in pairs(l) do
    print(k.. "\t"..v.." Bytes")
end
l = nil
