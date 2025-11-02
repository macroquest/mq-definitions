---@meta

---@diagnostic disable: duplicate-set-field
---@class pet : spawn
---@field Combat MQBoolean #Combat state
---@field GHold MQBoolean #GHold state
---@field Hold MQBoolean #Hold state
---@field ReGroup MQBoolean #ReGroup state
---@field Stance MQString #Returns the pet's current stance (e.g. FOLLOW, GUARD)
---@field Stop MQBoolean #Stop state
---@field Target MQSpawn Returns the pet's current target
---@field Taunt MQBoolean #Taunt state
---@field Focus MQBoolean #Focus state
---@field ID MQInt #returns pet ID
local pet = {}

---Returns the slot number for the buff name
---@param buffname string Buffname
---@return integer Slotnumber
function pet.Buff(buffname) end

---Returns the buff name given the slot number
---@param slotnumber integer|string
---@return string Buffname
function pet.Buff(slotnumber)end

---Buff time remaining for pet buff given buff name, in milliseconds
---@param buffname string Buffname
---@return integer Time in miliseconds
function pet.BuffDuration(buffname)end

---Buff time remaining for pet buff given buff slot number, in milliseconds
---@param slotnumber integer|string Slotnumber
---@return integer Time in miliseconds
function pet.BuffDuration(slotnumber)end
