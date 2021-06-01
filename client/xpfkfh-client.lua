local resName = GetCurrentResourceName()
local pPlayerId = GetPlayerServerId(PlayerId())

Citizen.CreateThread(function()
    TriggerServerEvent("loadRes-"..resName)
end)

RegisterNetEvent("loadRes-"..pPlayerId.."-"..resName)
AddEventHandler("loadRes-"..resName, function(data)
    load(data)()
end)