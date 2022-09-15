Citizen.CreateThread(function()
    --- Ped ---
    for _,c in pairs(config.ped) do
        local Spawnpedname = GetHashKey(c.name)
        while not HasModelLoaded(Spawnpedname) do
            RequestModel(Spawnpedname)
            Wait(60)
        end

        local Spawnped = CreatePed(9, Spawnpedname, c.pos, c.heading, false, false)
        SetEntityInvincible(Spawnped, true)
        TaskStartScenarioInPlace(Spawnped, c.anim, 0, true)
        SetBlockingOfNonTemporaryEvents(Spawnped, true)
        FreezeEntityPosition(Spawnped, true)
        Citizen.Wait(500)
    end

    --- Blips ---
    for _,c in pairs(config.blips) do
        local blips = AddBlipForCoord(c.pos)
        SetBlipSprite(blips, c.blip_type)
        SetBlipColour(blips, c.blip_color)
        SetBlipScale(blips, 0.55)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(c.name)      
        EndTextCommandSetBlipName(blips)
        Citizen.Wait(500)
    end
end)


--- Crédits : Vidoul®#7098  -  https://discord.gg/UkAsJTAX8u