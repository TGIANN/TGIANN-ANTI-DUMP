QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
local active = true

RegisterServerEvent('tgiann-hackkoruma:kick')
AddEventHandler('tgiann-hackkoruma:kick', function(url, hack)
    if active then
        local nick = GetPlayerName(source) 
        if nick == nil then nick = "Bilinmiyor" end
        local identifier = GetPlayerIdentifiers(source)[1]
        if identifier == nil then identifier = "Steam ID Bilinmiyor" end
        if url == nil then url = "Resim Çekilemedi" end
        
        if hack ~= "AFK" then
            TriggerEvent('DiscordBot:ToDiscord', 'hile', '```Nick: ('.. nick .. ') Steam İd: (' .. identifier .. ') ' .. hack .. '```'.. url)
            DropPlayer(source, "Ups Ufak Bir Sorun Oldu. Yetkililer ile İletişime Geçin")   
        else
            DropPlayer(source, "Uzun süredir haraket etmediğinden dolayı atıldın!")
        end
    end
end)

RegisterCommand("hack", function(source)
    if source == 0 then
        active = not active
        print("Sistem: ".. tostring(active))
    end
end)

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

QBCore.Functions.CreateCallback('tgiann-hackkoruma:GetPermissions', function(source, cb)
    local group = QBCore.Functions.GetPermission(source)
    cb(group)
end)