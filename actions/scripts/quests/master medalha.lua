function onUse(cid, item, frompos, item2, topos)
if item.uid == 8505 then
queststatus = getPlayerStorageValue(cid,85002)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um Master Medalha.!")
doPlayerAddItem(cid,5785,1 )
setPlayerStorageValue(cid,85002,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 