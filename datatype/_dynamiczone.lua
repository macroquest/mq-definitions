---@meta
---@class dynamiczone
---@field public InRaid fun():boolean
---@field public Leader fun():dzmember The leader of the dynamic zone
---@field public LeaderFlagged fun():boolean Returns true if the dzleader can successfully enter the dz (this also means the dz is actually Loaded.)Example: ${DynamicZone.LeaderFlagged}
---@field public MaxMembers fun():integer Maximum number of characters that can enter this dynamic zone
---@field public Members fun():integer Current number of characters in the dynamic zone
---@field public MinMembers fun():integer Minimum of members required
---@field public Name fun():string The full name of the dynamic zone
dynamiczone = {}

---Find the dynamic zone member by id
---@param id integer
---@return dzmember
function dynamiczone.Member(id) end

---Find the dynamic zone member by name
---@param name string
---@return dzmember
function dynamiczone.Member(name) end

---comment
---@param id integer
---@return dztimer
function dynamiczone.Timer(id) end

---comment
---@param name string
---@return dztimer
function dynamiczone.Timer(name) end

return dynamiczone