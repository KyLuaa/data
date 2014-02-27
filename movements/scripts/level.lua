function onStepIn(cid, item, position, fromPosition)

level = 300

if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
doPlayerSendCancel(cid,"I Need level " .. level .. " for pass an area!")
end
return TRUE
end