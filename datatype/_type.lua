--- @class mqtype
--- @field public Name fun(): string Type name
--- @field public ToString fun(): string Same as Name
mqtype = nil

---@param id integer # Internal ID number
---@return string # Member name based on an internal ID number (based on 1 through N, not all values will be used)
function mqtype.TypeMember(id) end

---@param name string 
---@return integer # Member internal ID number based on name (will be a number from 1 to N)
function mqtype.TypeMember(name) end