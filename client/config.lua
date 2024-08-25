ammuList = {
    {
        name = "elginavenue",
        label = "Elgin Avenue",
        position = vector4(22.30651, -1106.847, 29.79702, 341.5225)
    }
}

ammuCat = {
    ["elginavenue"] = {
        {label = "Armes Blanches",  name = "whiteWeapon"},
        {label = "Armes Légères",   name = "lighWeapon"},
        {label = "Armes Lourdes",   name = "heavyWeapon"},
        {label = "Accessoires",     name = "accessWeapon"}
    }
}

ammuItems = {
    ["elginavenue"] = {
        ["whiteWeapon"] = {
            {label = "Couteau", name = "weapon_knife", price = "2100"},
            {label = "Machete", name = "weapon_machete", price = "4500"}
        },
        ["lighWeapon"] = {
            {label = "Pistolet",        name = "weapon_pistol",     price = "2100"},
            {label = "Pistolet SNS",    name = "weapon_snspistol",  price = "4500"}
        },
        ["heavyWeapon"] = {
            {label = "Minigun",         name = "weapon_minigun",    price = "2100"},
            {label = "Lance Roquette",  name = "weapon_rpg",        price = "4500"}
        },
        ["accessWeapon"] = {
            {label = "Munition 9mm",        name = "ammo9",     price = "2100"},
            {label = "Munition Roquette",   name = "ammorpg",   price = "4500"}
        }
    }
}