ammuMain = zUI.CreateMenu(" ", "AMMU NATION", nil, nil, "https://media.discordapp.net/attachments/1275932606768222400/1277250561003098203/shopui_title_gunclub_1.png?ex=66cc7bc7&is=66cb2a47&hm=1be2344120cb9c5b2c1509d53aa77966cb5745a788725a326ffdc0e14fe23045&=&format=webp&quality=lossless")
local ammuCatMenu = zUI.CreateSubMenu(ammuMain, " ", "AMMU NATION")

local basketList, basketListIndex, catSelect = {}, 1, {}
ammuSelect = ""

ammuMain:SetItems(function(Items)
    Items:AddSeparator("Catalogue")
    Items:AddLine({ "#ea0303", "#840101"})
    for catName, catData in pairs(ammuCat[ammuSelect]) do
        Items:AddButton(("%s"):format(catData.label), ("Accéder à la catégorie des ~r~%s~s~."):format(catData.label), { RightLabel = "→"},
        function(onSelected, onHovered)
            if onSelected then
                catSelect = catData
            end
        end, ammuCatMenu)
    end
end)

ammuCatMenu:SetItems(function(Items)
    Items:AddList("Mode de Payement", "Choix du ~r~Moyen de payement~s~.", { "Liquide", "Carte Bancaire" }, {},
    function(onSelected, onHovered, onListChange, index)
        if onListChange then
            basketListIndex = index
        end
    end)
    Items:AddSeparator(("Catalogue - %s"):format(catSelect.label))
    Items:AddLine({ "#ea0303", "#840101"})
    for weaponName, weaponData in pairs(ammuItems[ammuSelect][catSelect.name]) do
        Items:AddButton(("%s"):format(weaponData.label), ('Achat d\'un / d\'une ~r~"%s"~s~.'):format(weaponData.label), { RightLabel = ("~r~%s$"):format(weaponData.price)},
        function(onSelected, onHovered)
            if onSelected then
                if catSelect.name == "accessWeapon" then
                    local weaponSelect = weaponData
                    weaponSelect.quantity = zUI.KeyboardInput(("%s"):format(weaponData.label), "Quantier à Ajouter", "1", 3)
                    weaponSelect.price = tonumber(weaponSelect.quantity * weaponSelect.price)
                    TriggerServerEvent("zAmmuNation:buyWeapon", weaponSelect, basketListIndex, catSelect)
                else
                    TriggerServerEvent("zAmmuNation:buyWeapon", weaponData, basketListIndex, catSelect)
                end
            end
        end)
    end
end)
