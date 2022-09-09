---@meta

--- NetBots Lua Bindings
---@class TLO.NetBots
---@field Client fun(index: integer): netbot The netbot at the given index in the array
---@field Counts fun(): integer The number of connected clients.
---@field Enable fun(): boolean The plugin status.
---@field Listen fun(): boolean The grab parameter status.
---@field Output fun(): boolean The send parameter status.
TLO.NetBots = {}

---@param name string # Name of he netbot
---@return netbot|"NULL" # Returns the netbot with the given name or 'NULL' if not found
function TLO.NetBots(name) end