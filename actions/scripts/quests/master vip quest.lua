
if item.uid == 8500 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a master staff.")
doPlayerAddItem(cid,7735,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 8501 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a master sword.")
doPlayerAddItem(cid,7959,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 8502 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a master axe.")
doPlayerAddItem(cid,7455,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 8503 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a master spear.")
doPlayerAddItem(cid,6576,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end