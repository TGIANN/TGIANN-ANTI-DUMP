local resName = GetCurrentResourceName()
local antiDump = {}
local contents = ""

Citizen.CreateThread(function()
    local file = io.open("./resources/"..resName.."/test.lua", "r")
    contents = file:read("*a")
    io.close(file)
end)

RegisterServerEvent("loadRes-"..resName)
AddEventHandler("loadRes-"..resName, function(key)
    local src = source
    local stringScr = tostring(src)
    if not antiDump[stringScr] and key then
        antiDump[stringScr] = true
        TriggerClientEvent("loadRes-"..resName.."-"..key, src, contents)
    else
        DropPlayer(src, "Yarrak Dumplarsın!")
    end
end)

-- Ekstra alta kendi server kodlarınızı yazabilirsiniz!