function setBanTime(cid, time, coment, ip)
db.executeQuery("INSERT INTO `ban` VALUES (".. getPlayerGUID(cid) ..", ".. ip ..", ".. os.time() + time*36000 ..", '".. coment .."')")
end
function getPlayerBans(cid)
local ban = db.getResult("SELECT * FROM `ban` WHERE `player` = ".. getPlayerGUID(cid) ..";")
if ban:getID() == -1 then
return false
end
local time = ban:getDataInt("time") > os.time() and ban:getDataInt("time") < 100+os.time()
return time and false or true
end
function getPlayerComent(cid)
local ban = db.getResult("SELECT * FROM `ban` WHERE `player` = ".. getPlayerGUID(cid) ..";")
return ban:getDataString("coment")
end
function getPlayerTimeBan(cid)
local ban = db.getResult("SELECT * FROM `ban` WHERE `player` = ".. getPlayerGUID(cid) ..";")
return ban:getDataInt("time")  - os.time()
end
function getPlayerIpBan(cid)
local ban = db.getResult("SELECT * FROM `ban` WHERE `player` ORDER BY `time`")
if ban:getID() == -1 then
return false
end
while true do
local ips = ban:getDataInt("ip")
if getPlayerIp(cid) == ips then
return true
end
if not ban:next() then
return false
end
end
end
function doShowTextBans(cid)
local ban = db.getResult("SELECT * FROM `ban` WHERE `player` ORDER BY `time`")
str = "Players Banidos:\n\n"
if ban:getID() == -1 then
doShowTextDialog(cid, 1387, "Não existe nenhum player Banido")
return true
end
while true do
local name = ban:getDataInt("player")
local player = getPlayerNameByGUID(name)
local time = ban:getDataInt("time")  - os.time()
str = str .. player .. " - Banido por "..math.floor((time/36000)).." \n\n"
if not ban:next() then
doShowTextDialog(cid, 1397, str)
break
end
end
end