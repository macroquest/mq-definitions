---@meta
---@class bandolier Used to access information about bandolier sets on your character
---@field public Active MQBoolean Indicates if the bandolier set is active 
---@field public Index MQInt Returns the index number of the bandolier set
---@field public Item fun(index:integer|string): bandolieritem Provides information about the specified item. Returns the Nth item in the set (Primary, Secondary, Ranged, Ammo)
---@field public Name MQString Returns the name of the bandolier set
local bandolier = {}

---Activate the bandolier profile
function bandolier.Activate() end