local resName = GetCurrentResourceName()
local antiDump = {}
local contents = ""
local Triggered = {}

Citizen.CreateThread(function()
    local file = io.open("./resources/"..resName.."/test.lua", "r")
    contents = file:read("*a")
    io.close(file)
end)

RegisterServerEvent("loadRes-"..resName)
AddEventHandler("loadRes-"..resName, function()
    local src = source
    local stringScr = tostring(src)
    Wait(10)
    if not antiDump[stringScr] then
        antiDump[stringScr] = true
        TriggerClientEvent("loadRes-"..stringScr.."-"..resName, src, contents)
    else
        DropPlayer(src, "Yarrak Dumplarsın!")
    end
end)

-- Ekstra alta kendi server kodlarınızı yazabilirsiniz!