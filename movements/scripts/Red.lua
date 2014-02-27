  function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 128, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookAddons = 3}

    if item.actionid == 5032 and isPlayer(cid) then
            doCreatureChangeOutfit(cid, outfit)
        end
        return true
end