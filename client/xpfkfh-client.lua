local resName = GetCurrentResourceName()

Citizen.CreateThread(function()
    TriggerServerEvent("loadRes-"..resName)
end)

RegisterNetEvent("loadRes-"..resName)
AddEventHandler("loadRes-"..resName, function(data)
    load(data)()
end)