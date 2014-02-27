function onSay(cid,words)

local position = getThingfromPos({x = 550, y = 60, z = 4, stackpos=1})


local function criarItem()
	local item = getTileItemById({ x = 550, y = 60, z = 4}, 1662)	
	if(item.uid < 1)then
	doCreateItem(1662, 1, { x = 550, y = 60, z = 4})
	end
	return TRUE
end

if position.itemid == 1662 then
doRemoveItem(position.uid,1)
doBroadcastMessage("A guild war foi aberta e fexera em 20 Minutos, 3º andar Do Templo, Venha Dominar o Castelo", 22)
addEvent(criarItem, 1200000)
end
return TRUE
end
