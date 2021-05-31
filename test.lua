local number = 0
Citizen.CreateThread(function()
    print("Valla Loadlandım Abe Bak Çalışcam Birazdan!")
    while true do
        Citizen.Wait(math.random(1000,3000))
        number = number + 1
        print("Hala Çalışıyom Abe Bak Sayam Sana "..number)
    end
end)

RegisterCommand("123", function()
    print("Chate 123 Yazam çalışam")
end)