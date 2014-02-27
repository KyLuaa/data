----AOL - BY: The Sleeper
function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 1500) == TRUE then
local bp = doPlayerAddItem(cid, 8473, 100)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Comprei 100 ultimate health potion", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Nao Tem Dinheiro Para Comprar 100 ultimate health potion", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end