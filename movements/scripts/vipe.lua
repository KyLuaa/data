-- Script Vip Sytem 1.0 --
function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Voc� n�o e vip ,para adqrir sua vip, digite !buyvip custa 2kk, se n�o tiver dinheiro n�o posso fazer nada! rss.",
msgWelcome = "Seja Bem Vindo a Area vip."
}

if getPlayerStorageValue(cid, 13540) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end
