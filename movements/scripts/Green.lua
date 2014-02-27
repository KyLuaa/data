  function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 128, lookHead = 120, lookBody = 120, lookLegs = 120, lookFeet = 120, lookAddons = 3}

    if item.actionid == 5031 and isPlayer(cid) then
            doCreatureChangeOutfit(cid, outfit)
        end
        return true
end