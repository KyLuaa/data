function onUse(cid, item, frompos, item2, topos)
if item.uid == 8503 then
queststatus = getPlayerStorageValue(cid,85000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou Uma Master Shot Stone!.")
doPlayerAddItem(cid,5907,1 )
setPlayerStorageValue(cid,85000,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 