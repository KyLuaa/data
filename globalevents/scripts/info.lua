function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Novos Comandos Baiak Yurots 2014.!

!aol
!bless
!food
!topfrags
!glist e !glist 'Nome da Guild'

Em Breve Mais...
BY : BaiakLula

facebook.com/luizhenrique.baiak
]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end