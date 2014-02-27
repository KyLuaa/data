local config = {
      lottery_hour = "1 Hours", -- Time to next lottery (only for broadcast message, real time you can set on globalevents.xml)
      rewards_id = {8858, 12657, 15414, 12645, 12644,12647,12648,12644,7366,2352,12642,12649,12646,2390,8931,8925}, -- Rewards ID
      crystal_counts = 100, -- Used only if on rewards_id is crystal coin (ID: 2160).
      website = "yes" -- Only if you have php scripts and table `lottery` in your database!
        }
function onThink(interval, lastExecution)
if(getWorldCreatures(0) == 0)then
  return true
end

        local list = {}
        for i, tid in ipairs(getPlayersOnline()) do
  list[i] = tid
end

local winner = list[math.random(1, #list)]
local random_item = config.rewards_id[math.random(1, #config.rewards_id)]

if(random_item == 2160) then
  doPlayerAddItem(winner, random_item, config.crystal_counts)
  doBroadcastMessage("[Loteria System] Winner: " .. getCreatureName(winner) .. ", Reward: " .. config.crystal_counts .. " " .. getItemNameById(random_item) .. "s! Congratulations! (Proxima Loteria in " .. config.lottery_hour .. ")")
else
  doBroadcastMessage("[Loteria System] Winner: " .. getCreatureName(winner) .. ", Reward: " .. getItemNameById(random_item) .. "! Congratulations! (Proxima Loteria in " .. config.lottery_hour .. ")")
  doPlayerAddItem(winner, random_item, 1)
end

if(config.website == "yes") then
  db.executeQuery("INSERT INTO `lottery` (`name`, `item`) VALUES ('".. getCreatureName(winner) .."', '".. getItemNameById(random_item) .."');")
end
return true
end