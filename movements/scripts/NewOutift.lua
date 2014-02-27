  function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 128, lookHead = 79, lookBody = 88, lookLegs = 94, lookFeet = 0, lookAddons = 0}

    if item.actionid == 5034 and isPlayer(cid) then
            doCreatureChangeOutfit(cid, outfit)
        end
        return true
end