local loadShopZoneBlips = function()
    for blipId, blip in pairs(ammuList) do
        local b = AddBlipForCoord(blip.position.x, blip.position.y, blip.position.z)
        SetBlipSprite(b, 110)
        SetBlipColour(b, 6)
        SetBlipAsShortRange(b, false)
        SetBlipScale(b, 0.6)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Ammu Nation")
        EndTextCommandSetBlipName(b)
    end

    while true do
        local interval = 500
        local pos = GetEntityCoords(PlayerPedId())
        local closeToMarker = false
        for zoneId, zone in pairs(ammuList) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), zone.position.x, zone.position.y, zone.position.z, true) < 8.0 then
                closeToMarker = true
                DrawMarker(25, zone.position.x, zone.position.y, zone.position.z-0.88, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 156, 46, 33, 255, 0, 0, 0, 0, nil, nil, 0)
                if GetDistanceBetweenCoords(pos, zone.position.x, zone.position.y, zone.position.z, true) < 2.0 then
                    ESX.Game.Utils.DrawText3D(zone.position, (("~r~%s\n[E]"):format(zone.label) or "~r~Pour intéragir"), 0.8, 0)
                    if IsControlJustPressed(0, 51) then
                        ammuSelect = zone.name
                        ammuMain:SetVisible(not ammuMain:IsVisible())
                    end
                end
            end
        end
        if closeToMarker then
            interval = 0
        end
        Wait(interval)
    end
end

Citizen.CreateThread(function()
    Wait(5000)
    loadShopZoneBlips()
end)