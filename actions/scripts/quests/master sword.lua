function onUse(cid, item, frompos, item2, topos)
if item.uid == 8501 then
queststatus = getPlayerStorageValue(cid,85000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma Master Sword!.")
doPlayerAddItem(cid,7959,1 )
setPlayerStorageValue(cid,85000,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 