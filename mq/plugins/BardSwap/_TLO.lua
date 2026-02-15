---@meta

--- ActorAdvPath Lua Bindings
---@class TLO.BardSwap
--- @field public Swapping MQBoolean
--- @field public Excluded MQBoolean
--- @field public MeleeSwap MQBoolean
--- @field public Delay MQInt
--- @field public CurrentSwap MQString
TLO.BardSwap = {}

---@alias BardSwapStatus "TRUE"|"FALSE"

---@return BardSwapStatus BardSwap status (same as Swapping)
function TLO.BardSwap() end