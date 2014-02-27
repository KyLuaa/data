-- [(  Script edited by: www.ChaitoSoft.com )] --
function onSay(cid, words, param)
if getPlayerBlessing(cid, 1) or getPlayerBlessing(cid, 2) or getPlayerBlessing(cid, 3) or getPlayerBlessing(cid, 4) or getPlayerBlessing(cid, 5) then
doPlayerSendCancel(cid,'Voce Ja Tem Todas as Bless.')
else
if doPlayerRemoveMoney(cid, 20000) == TRUE then
doPlayerAddBlessing(cid, 1)
doPlayerAddBlessing(cid, 2)
doPlayerAddBlessing(cid, 3)
doPlayerAddBlessing(cid, 4)
doPlayerAddBlessing(cid, 5)
doSendMagicEffect(getPlayerPosition(cid), 28)
doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, 'Voce Esta Salvo, Graças a [HOSTER] Luiziin.')
else
doPlayerSendCancel(cid, "Voce Prescisa De 20k Para Ter Todas as Bless.")
end
end
return TRUE
end