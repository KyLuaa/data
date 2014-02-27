local config = {
    positions = {
        ["Baiakziin"] = { x = 160, y = 54, z = 7 },
        ["Quest!"] = { x = 399, y = 52, z = 6 },
        ["Welcome"] = { x = 158, y = 51, z = 4 },
        ["Paladin"] = { x = 1257, y = 431, z = 12 },
        ["500k"] = { x = 164, y = 54, z = 7 },
        ["Mage"] = { x = 1255, y = 431, z = 12 },
        ["Knight"] = { x = 1259, y = 431, z = 12 },
        ["Kniight"] = { x = 1261, y = 431, z = 12 },
        ["Gratis"] = { x = 1263, y = 431, z = 12 },
        ["Gratiis"] = { x = 1265, y = 431, z = 12 },
        ["Vip City"] = { x = 160, y = 44, z = 7 },
        ["Teleports"] = { x = 152, y = 50, z = 7 },
        ["War Team"] = { x = 157, y = 47, z = 7 },
        ["Green"] = { x = 468, y = 591, z = 7 },
        ["Red"] = { x = 474, y = 591, z = 7 },
        ["Ilha"] = { x = 153, y = 50, z = 7 },
        ["Trainers2"] = { x = 163, y = 49, z = 7 },
        ["Trainers"] = { x = 154, y = 50, z = 7 }
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(3, 260))
    end
    
    return TRUE
end  