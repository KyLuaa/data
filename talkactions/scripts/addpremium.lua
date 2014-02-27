function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

local t = string.explode(param, ",")
local days = tonumber(t[1])
if(not days) then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digitou errado.")
    return true
end
local player = getPlayerByName(t[2], false)
if not player then
doPlayerSendCancel(cid, "player not found.")
end
doPlayerAddPremiumDays(player, days)
end