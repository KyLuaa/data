  function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 127, lookHead = 90, lookBody = 90, lookLegs = 90, lookFeet = 90, lookAddons = 0}

    if item.actionid == 5033 and isPlayer(cid) then
            doCreatureChangeOutfit(cid, outfit)
        end
        return true
end