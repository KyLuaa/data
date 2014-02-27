function onUse(cid, item, frompos, item2, topos)
if item.uid == 8504 then
queststatus = getPlayerStorageValue(cid,85001)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um Master Ring.!")
doPlayerAddItem(cid,7708,1 )
setPlayerStorageValue(cid,85001,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 