function onDeath(cid, corpse, deathList)
if isPlayer(deathList[1]) then
return true,doBroadcastMessage("[DeathCast] Informs:\n".. getCreatureName(cid) .. "[" .. getPlayerLevel(cid) .. "] was Killed by player: " .. getCreatureName(deathList[1]) .. "[" .. getPlayerLevel(deathList[1]) .. "]",18)
end
return doBroadcastMessage("[DeathCast] Informs:\nThe player ".. getCreatureName(cid) .. "[" .. getPlayerLevel(cid) .. "] was Killed by " .. getCreatureName(deathList[1]) .. ".",20)
end