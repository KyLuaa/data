function onUse(cid, item, frompos, item2, topos)
if item.uid == 10206 then
queststatus = getPlayerStorageValue(cid,20204)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um Necromancer ShielD.!")
doPlayerAddItem(cid,6433,1 )
setPlayerStorageValue(cid,20204,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 