----AOL - BY: The Sleeper
function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 1000) == TRUE then
local bp = doPlayerAddItem(cid, 2789, 100)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Comprei Food", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Nao Tem Dinheiro Para Comprar Food", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end