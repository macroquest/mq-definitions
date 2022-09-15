---@meta

---@diagnostic disable: duplicate-set-field
---@class pet : spawn
---@field Combat fun(): boolean Combat state
---@field Ghold fun(): boolean GHold state
---@field Hold fun(): boolean Hold state
---@field ReGroup fun(): boolean ReGroup state
---@field Stance fun(): string Returns the pet's current stance (e.g. FOLLOW, GUARD)
---@field Stop fun(): boolean Stop state
---@field Target spawn Returns the pet's current target
---@field Taunt fun(): boolean Taunt state
---@field Focus fun(): boolean Focus state
---@field ID fun(): integer returns pet ID
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
