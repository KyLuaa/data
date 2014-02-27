function onUse(cid, item, frompos, item2, topos)
if item.uid == 10208 then
queststatus = getPlayerStorageValue(cid,20206)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou 2kk.!")
doPlayerAddItem(cid,2160,200 )
setPlayerStorageValue(cid,20206,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 