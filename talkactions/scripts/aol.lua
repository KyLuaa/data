----AOL - BY: The Sleeper
function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 10000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Comprei Aol", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Nao Tem Dinheiro Para Comprar Aol,Custa 10k", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end