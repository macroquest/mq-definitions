---@diagnostic disable: duplicate-set-field
---@class pet
---@field Combat boolean Combat state
---@field Ghold boolean GHold state
---@field Hold boolean Hold state
---@field ReGroup boolean ReGroup state
---@field Stance string Returns the pet's current stance (e.g. FOLLOW, GUARD)
---@field Stop boolean Stop state
---@field Target spawn Returns the pet's current target
---@field Taunt boolean Taunt state
---@field Focus boolean Focus state
---@field Buff boolean
---@field ID int returns pet ID

---@type pet
local pet = {}

---Returns the slot number for the buff name
---@param buffname string Buffname
---@return integer Slotnumber
function pet.Buff(buffname) end

---Returns the buff name given the slot number
---@param slotnumber integer
---@return string Buffname
function pet.Buff(slotnumber)end

---Buff time remaining for pet buff given buff name, in milliseconds
---@param buffname string Buffname
---@return integer Time in miliseconds
function pet.BuffDuration(buffname)end

---Buff time remaining for pet buff given buff slot number, in milliseconds
---@param slotnumber integer Slotnumber
---@return integer Time in miliseconds
function pet.BuffDuration(slotnumber)end
