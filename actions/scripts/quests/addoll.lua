function onUse(cid, item, frompos, item2, topos)
if item.uid == 10205 then
queststatus = getPlayerStorageValue(cid,20203)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou 1 Addon Doll.!")
doPlayerAddItem(cid,9693,1 )
setPlayerStorageValue(cid,20203,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 