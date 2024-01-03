--- @class fellowship
--- @field public Campfire MQBoolean #TRUE if campfire is up, FALSE if not
--- @field public CampfireDuration ticks | fun(): ticks Time left on current campfire
--- @field public CampfireX MQFloat #Campfire X location
--- @field public CampfireY MQFloat #Campfire Y location
--- @field public CampfireZ MQFloat #Campfire Z location
--- @field public CampfireZone MQZone Zone information for the zone that contains your campfire
--- @field public ID MQInt #Fellowship ID
--- @field public Leader MQString #Fellowship leader's name
--- @field public Members MQInt #Number of members in the fellowship
--- @field public MotD MQString #Fellowship Message of the Day
--- @field public ToString MQString #TRUE if currently in a fellowship, FALSE if not
local fellowship = nil

---@diagnostic disable: duplicate-set-field
---@param name string: Character name
---@return fellowshipmember
function fellowship.Member(name) end

---Find an item in a list box by partial match (use window.List[=text] for exact). Only works on list boxes. Use of y is optional and allows selection of the column of the window to search in.
---@param index integer: Index
---@return fellowshipmember
function fellowship.Member(index) end

---@diagnostic enable: duplicate-set-field
