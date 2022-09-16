---@class corpse : spawn Data related to the current lootable corpse.  See [Corpse](https://docs.macroquest.org/reference/top-level-objects/tlo-corpse/)
---@field public Items MQFloat #Number of items on the corpse
---@field public Open fun():boolean Corpse open?
corpse = {}

--- Finds an item by partial name in this corpse (use =<name> for exact match)
---@param name string
---@return item
function corpse.Item(name) end

--- Nth item on the corpse
---@param index any
---@return item
function corpse.Item(index) end