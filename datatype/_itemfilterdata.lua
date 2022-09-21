---@meta
---@class itemfilterdata
---@field AutoRoll fun(): boolean The Auto Roll state (dice icon)
---@field Greed fun(): boolean The Greed (GD) state
---@field IconID MQInt The ID of the icon
---@field ID MQInt The ID of the item
---@field Name fun(): string The Name of the item
---@field Need fun(): boolean The Need (ND) state
---@field Never fun(): boolean The Never (NV) state
---@field Types MQInt Bit field representing all the loot filter flags for this item
