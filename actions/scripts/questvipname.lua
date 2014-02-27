--VIP Name System foi criado por Baiaklula
--Creditos 100% Baiaklula - Rookwar
function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 13541 then
queststatus = getPlayerStorageValue(cid,13541)
if queststatus == -1 or queststatus == 0 then
doCreatureSay(cid, "Em Menos de 5 Segundos Seu Char ira Logar Automaticamente Para Receber (VIP) Na Frente do Nome.", TALKTYPE_ORANGE_1)
db.executeQuery("UPDATE `players` SET `name` = '(VIP) "..getCreatureName(cid).."' WHERE `id` = "..getPlayerGUID(cid)..";")	
doPlayerSendTextMessage(cid,25,"Relogue Seu Char e Faça Sua Acc Novamente!") 
doPlayerAddAddons(cid, 1)	
addEvent(doRemoveCreature, 5*1000, cid, true) 
setPlayerStorageValue(cid, 13541, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
else
doPlayerSendTextMessage(cid,22,"Você Ja Tem (VIP) na Frente do Nome!")
end
return true
end
end