                                        -- config -- 
WAR_MAP_NAMES = {'FIBULA', 'EDRON', ' VENORE', 'THAIS', 'ARENA'} 
WAR_SPAWNS = {} 
WAR_SPAWNS[1] = {{2,3},{4,5}} -- map 1 
WAR_SPAWNS[2] = {{6,7},{8,9}} -- map 2 
WAR_SPAWNS[3] = {{10,11},{12,13}} -- map 2 
WAR_SPAWNS[4] = {{14,15},{16,17}} -- map 2 
WAR_SPAWNS[5] = {{18,18},{19,19}} -- map 2  


WAR_MAP_CYCLE = {{1,2},{2,3},{3,4},{4,5},{5,1}} 
WAR_COLORS = {{98,94,94,94},{89,89,89,89}} 
WAR_TEAM_NAMES = {'Team Red','Team Blue'} 
WAR_BROADCAST_INTERVAL_TOP5 = 213 

WAR_START_LEVEL = 140 
WAR_TEAMS = 1 

WAR_POINTS_FOR_KILL = 3 
WAR_POINTS_FOR_KILL_ASSIST = 1 

-------------------------------------------------------- 
STORAGE_LAST_KILLER_GUID = 10100 
STORAGE_LAST_KILLER_GUID_TIMES = 10101 
STORAGE_LAST_KILLER_IP = 10200 
STORAGE_LAST_KILLER_IP_TIMES = 10201 
STORAGE_LAST_KILLER_ACCOUNT = 10300 
STORAGE_LAST_KILLER_ACCOUNT_TIMES = 10301 
STORAGE_POINTS = 11000 
STORAGE_TEAM_ID = 12000 
STORAGE_SKULL = 13000 
STORAGE_DEPOT = 14000 

GLOBAL_STORAGE_MAP = 500 
GLOBAL_STORAGE_MAP_CHANGE_TIME = 501 
GLOBAL_STORAGE_TEAM_1_FRAGS = 600 
GLOBAL_STORAGE_TEAM_2_FRAGS = 700 
GLOBAL_STORAGE_BROADCAST_TOP5 = 800 

warInitialized = 0 
function getTime(s)
local n = math. floor(s / 60) 
s = s - (60 * n)
return n, s
end

function getSpawn(cid) 
    local map_info = WAR_MAP_CYCLE[getGlobalStorageValue(GLOBAL_STORAGE_MAP)] 
    local map_id = map_info[1] 
    local map_spawns = WAR_SPAWNS[map_id] 
    local team_spawns = map_spawns[getPlayerStorageValue(cid, STORAGE_TEAM_ID)] 
    return getTownTemplePosition(team_spawns[math.random(1,#team_spawns)]) 
end 

function getTeamMembers(id) 
    local players = getPlayersOnline() 
    local team = {} 
    if #players == 0 then 
        return team 
    end 
    for i, cid in ipairs(players) do 
        if getPlayerStorageValue(cid, STORAGE_TEAM_ID) == id and getPlayerGroupId(cid) == 1 then 
            table.insert(team, cid) 
        end 
    end 
    return team 
end 

function updateOutfit(cid) 
    if WAR_TEAMS == 1 then --outfit 
        local colors = WAR_COLORS[getPlayerStorageValue(cid, STORAGE_TEAM_ID)] 
        local outfit = getCreatureOutfit(cid) 
        outfit.lookHead = colors[1] 
        outfit.lookBody = colors[2] 
        outfit.lookLegs = colors[3] 
        outfit.lookFeet = colors[4] 
        doCreatureChangeOutfit(cid, outfit) 
    end 
end 

function setTeam(cid) 
    if WAR_TEAMS ~= 1 then 
        setPlayerStorageValue(cid, STORAGE_TEAM_ID, 1) 
    else 
        local team1 = getTeamMembers(1) 
        local team2 = getTeamMembers(2) 
        if #team1 >= #team2 then 
            setPlayerStorageValue(cid, STORAGE_TEAM_ID, 2) 
        else 
            setPlayerStorageValue(cid, STORAGE_TEAM_ID, 1) 
        end 
        updateOutfit(cid) 
    end 
end 

function cronWar() 
    if getGlobalStorageValue(GLOBAL_STORAGE_MAP_CHANGE_TIME) < os.time() then -- change map 
        local map_info = WAR_MAP_CYCLE[getNextMapId()] 
        local map_id = map_info[1]
       doTeleportThing(pid,getTeamSpawn(pid),false) -- teleporta para a base    
                 

if WAR_TEAMS == 1 then 
            doBroadcastMessage(getTeamScore(), MESSAGE_STATUS_DEFAULT) 
        end 
        setMap(getNextMapId())
        
    elseif getGlobalStorageValue(GLOBAL_STORAGE_BROADCAST_TOP5) < os.time() then -- broadcast top 5 
        setGlobalStorageValue(GLOBAL_STORAGE_BROADCAST_TOP5, os.time()+WAR_BROADCAST_INTERVAL_TOP5) 
        addEvent(doBroadcastMessage, 1000, getTop5Players(), MESSAGE_STATUS_CONSOLE_ORANGE) 
    end 
    addEvent(cronWar, 1000) 
end 

function getNextMapId() 
    if getGlobalStorageValue(GLOBAL_STORAGE_MAP) == #WAR_MAP_CYCLE then 
        return 1 
    end 
    return getGlobalStorageValue(GLOBAL_STORAGE_MAP)+1 
end 

function getTop5Players() 
    local players = getPlayersOnline() 
    if #players == 0 then 
        return top5text 
    end 
    local player1 = {0,-1} 
    local player2 = {0,-1} 
    local player3 = {0,-1} 
    local player4 = {0,-1} 
    local player5 = {0,-1} 
    local top5text = "Top 5 Fragers Online" 
    for i, cid in ipairs(players) do 
        if getPlayerStorageValue(cid,19999) > player1[2] then 
            player5 = {player4[1], player4[2]} 
            player4 = {player3[1], player3[2]} 
            player3 = {player2[1], player2[2]} 
            player2 = {player1[1], player1[2]} 
            player1 = {cid, getPlayerStorageValue(cid,19999)} 
        elseif getPlayerStorageValue(cid,19999) > player2[2] then 
            player5 = {player4[1], player4[2]} 
            player4 = {player3[1], player3[2]} 
            player3 = {player2[1], player2[2]} 
            player2 = {cid, getPlayerStorageValue(cid,19999)} 
        elseif getPlayerStorageValue(cid,19999) > player3[2] then 
            player5 = {player4[1], player4[2]} 
            player4 = {player3[1], player3[2]} 
            player3 = {cid, getPlayerStorageValue(cid,19999)} 
        elseif getPlayerStorageValue(cid,19999) > player4[2] then 
            player5 = {player4[1], player4[2]} 
            player4 = {cid, getPlayerStorageValue(cid,19999)} 
        elseif getPlayerStorageValue(cid,19999) > player1[2] then 
            player5 = {cid, getPlayerStorageValue(cid,19999)} 
        end 
    end 
    if player1[1] > 0 then 
        top5text = top5text .. "\n1. " .. getCreatureName(player1[1]) .. " - " .. player1[2]+1 .. " frags" 
    end 
    if player2[1] > 0 then 
        top5text = top5text .. "\n2. " .. getCreatureName(player2[1]) .. " - " .. player2[2]+1 .. " frags" 
    end 
    if player3[1] > 0 then 
        top5text = top5text .. "\n3. " .. getCreatureName(player3[1]) .. " - " .. player3[2]+1 .. " frags" 
    end 
    if player4[1] > 0 then 
        top5text = top5text .. "\n4. " .. getCreatureName(player4[1]) .. " - " .. player4[2]+1 .. " frags" 
    end 
    if player5[1] > 0 then 
        top5text = top5text .. "\n5. " .. getCreatureName(player5[1]) .. " - " .. player5[2]+1 .. " frags" 
    end 
    return top5text 
end
function getTeamScore() 
    return WAR_TEAM_NAMES[1] .. " - " .. getGlobalStorageValue(GLOBAL_STORAGE_TEAM_1_FRAGS) .. " : " .. getGlobalStorageValue(GLOBAL_STORAGE_TEAM_2_FRAGS) .. " - " .. WAR_TEAM_NAMES[2] 
end 

function setMap(id) 
    local map_info = WAR_MAP_CYCLE[id] 
    setGlobalStorageValue(GLOBAL_STORAGE_MAP,id) 
    setGlobalStorageValue(GLOBAL_STORAGE_MAP_CHANGE_TIME,os.time()+60*40)  
    local players = getPlayersOnline() 
    for i, cid in ipairs(players) do                
     addEvent(doRemoveCreature, 5*1000, cid, true)
setGlobalStorageValue(17778,0) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(17779,0) -- ninguem ficar com bandeira time vermelho!
setGlobalStorageValue(18888,0) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(18889,0) -- ninguem ficar com bandeira time vermelho!!
setGlobalStorageValue(5002,0) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(5001,0) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(4002,0) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(4001,0) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(11544 ,0) -- ninguem ficar com bandeira time verde!
setGlobalStorageValue(11543,0) -- ninguem ficar com bandeira time verde!
            doCreatureSetSkullType(cid, 0)
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid)) 
            doCreatureAddMana(cid, getCreatureMaxMana(cid))
            doChangeSpeed(cid, -getCreatureSpeed(cid) + getCreatureBaseSpeed(cid))
            doTeleportThing(cid, getSpawn(cid), TRUE)
            removeConditions(cid) 
        end 
    end 

function removeConditions(cid) 
    doRemoveCondition(cid, CONDITION_INFIGHT) 
    doRemoveCondition(cid, CONDITION_PARALYZE) 
    doRemoveCondition(cid, CONDITION_ENERGY) 
    doRemoveCondition(cid, CONDITION_FIRE) 
    doRemoveCondition(cid, CONDITION_POISON) 
    doRemoveCondition(cid, CONDITION_DRUNK) 
end 