----AOL - BY: The Sleeper
function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 1200) == TRUE then
local bp = doPlayerAddItem(cid, 8472, 100)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Comprei 100 great spirit potion", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Nao Tem Dinheiro Para Comprar 100 great spirit potion", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end