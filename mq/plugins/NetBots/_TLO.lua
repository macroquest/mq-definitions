---@meta

--- NetBots Lua Bindings
---@class TLO.NetBots
---@field Client fun(index: integer): string The name of the netbot at the given index in the array
---@field Counts MQInt #The number of connected clients.
---@field Enable MQBoolean #The plugin status.
---@field Listen MQBoolean #The grab parameter status.
---@field Output MQBoolean #The send parameter status.
TLO.NetBots = {}

---@param name string # Name of he netbot
---@return netbot|"NULL" # Returns the netbot with the given name or 'NULL' if not found
function TLO.NetBots(name) end
