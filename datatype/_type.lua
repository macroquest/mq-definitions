--- @class mqtype
--- @field public Name MQString #Type name
--- @field public ToString MQString #Same as Name
local mqtype = nil

---@diagnostic disable: duplicate-set-field
---@param id integer # Internal ID number
---@return string # Member name based on an internal ID number (based on 1 through N, not all values will be used)
function mqtype.Member(id) end

---@param name string 
---@return integer # Member internal ID number based on name (will be a number from 1 to N)
function mqtype.Member(name) end
---@diagnostic enable: duplicate-set-field