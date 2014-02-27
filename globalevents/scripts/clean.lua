function executeClean()
	doCleanMap()
	doBroadcastMessage("Mapa limpo, próximo clean daqui 2 horas.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("O mapa vai ser limpo daqui 30 seg! Por favor recolha seus items!")
	addEvent(executeClean, 5000)
	return true
end
