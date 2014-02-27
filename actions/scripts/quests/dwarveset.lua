function onUse(cid, item, frompos, item2, topos)
if item.uid == 10207 then
queststatus = getPlayerStorageValue(cid,20205)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um dwarveset.!")
doPlayerAddItem(cid,2496,1 )
doPlayerAddItem(cid,2504,1 )
doPlayerAddItem(cid,2503,1 )
setPlayerStorageValue(cid,20205,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 