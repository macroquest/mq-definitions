---@meta AutoLoot

---@class AutoLoot
---@field Active MQBoolean # TRUE when using MQ2AutoLoot to handle advanced looting
---@field SellActive MQBoolean # TRUE when selling items to a merchant
---@field BuyActive MQBoolean # TRUE when buying items at a merchant
---@field DepositActive MQBoolean # TRUE when depositing items to a personal/guild banker
---@field BarterActive MQBoolean # TRUE when bartering items
---@field FreeInventory MQInt # Number of empty inventory slots not in excludebag1 or excludebag2
local AutoLoot = {}
