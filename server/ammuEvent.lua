RegisterServerEvent("zAmmuNation:buyWeapon")
AddEventHandler("zAmmuNation:buyWeapon", function(weaponData, basketIndex, catSelect)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local account = ""
    if basketIndex == 1 then account = "money" elseif basketIndex == 2 then account = "bank" end
    if xPlayer.getAccount(account).money >= weaponData.price then
        xPlayer.removeAccountMoney(account, weaponData.price)
        if catSelect ~= "accessWeapon" then
            xPlayer.addWeapon(weaponData.name, 1)
        else
            xPlayer.addInventoryItem(weaponData.name, weaponData.quantity)
        end
    else
        if catSelect ~= "accessWeapon" then
            xPlayer.showNotification(("Vous n'avez pas assez d'Argent pour acheter x%s %s"):format(weaponData.quantity, weaponData.label))
        else
            xPlayer.showNotification(("Vous n'avez pas assez d'Argent pour acheter un / une %s"):format(weaponData.label))
        end
    end
end)