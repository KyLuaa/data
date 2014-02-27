local quests = {
   -- [" Nome da quest "] = Storageid,
   ["Master Staff"] = 8500,
   ["Master Sword"] = 8501,
   ["Master Axe"] = 8502,
   ["Master Spear"] = 8503,
   ["Master Ring] = 8504,
   ["Master Medalha] = 8505,
   ["Soft Boots"] = 10005,
   ["500k Quest"] = 10105,
   ["Golden Helmet"] = 10008,
   ["Emerald Sword"] = 10009,
   ["Speelbook of Dark Mysteries"] = 10010,
   ["Archer Armor"] = 10011,
   ["Robe of The Underworld"] = 10012,
   ["Fireborn Giant Armor"] = 10013,
   ["Obsidian Trucher"] = 10014,
   ["Royal Crossbow"] = 10015,
   ["Warsinger Bow"] = 10016,
   ["Hellforged Axe"] = 10017,
   ["Baiak Helmet"] = 10018,
   ["Baiak of Boots"] = 10019,
   ["Baiak Armor"] = 10020,

}
 
function onSay(cid)
   local str = "#Quest(s) não concluída(s):\n"
   local conc = {}
 
   for i, v in pairs(quests) do
      if getPlayerStorageValue(cid, v) > 0 then
         table.insert(conc, i)
      else
         str = str .. "\n".. i .. " - Não concluída"
      end
   end
 
   str = str .. "\n\n#Quest(s) concluída(s):\n"
 
   for _, v in pairs(conc) do
      str = str .. "\n".. v .. " - Concluída"
   end
 
   return doShowTextDialog(cid, 1746, str)
end