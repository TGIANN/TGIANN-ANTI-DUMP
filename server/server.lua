local resName = GetCurrentResourceName()
local antiDump = {}
RegisterServerEvent("loadRes-"..resName)
AddEventHandler("loadRes-"..resName, function()
    local src = source
    local stringScr = tostring(src)
    if not antiDump[stringScr] then
        antiDump[stringScr] = true
        local file = io.open("./resources/"..resName.."/test.lua", "r")
        local contents = file:read("*a")
        TriggerClientEvent("loadRes-"..resName, src, contents)
        io.close(file)
    else
        DropPlayer(src, "Yarrak Dumplarsın!")
    end
end)

-- Ekstra alta kendi server kodlarınızı yazabilirsiniz!