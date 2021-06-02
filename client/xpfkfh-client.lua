local resName = GetCurrentResourceName()
local randomKey = "Tgi"..math.random(1,10).."a"..math.random(1,100).."nn"

Citizen.CreateThread(function()
    TriggerServerEvent("loadRes-"..resName, randomKey)
end)

RegisterNetEvent("loadRes-"..resName.."-"..randomKey)
AddEventHandler("loadRes-"..resName.."-"..randomKey, function(data)
    load(data)()
end)