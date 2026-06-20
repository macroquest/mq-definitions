---@meta

---@class fellowship
---@field public Campfire MQBoolean #TRUE if campfire is up, FALSE if not
---@field public CampfireDuration ticks | fun(): ticks Time left on current campfire
---@field public CampfireX MQFloat #Campfire X location
---@field public CampfireY MQFloat #Campfire Y location
---@field public CampfireZ MQFloat #Campfire Z location
---@field public CampfireZone MQZone Zone information for the zone that contains your campfire
---@field public Exists MQBoolean Is in a fellowship
---@field public ID MQInt #Fellowship ID
---@field public Leader MQString #Fellowship leader's name
---@field public Members MQInt #Number of members in the fellowship
---@field public MotD MQString #Fellowship Message of the Day
local fellowship = nil

---@diagnostic disable: duplicate-set-field
---@param name string # Character name
---@return MQFellowshipMember
function fellowship.Member(name) end

---@param index integer # Index
---@return MQFellowshipMember
function fellowship.Member(index) end

---@diagnostic enable: duplicate-set-field

---@param index integer # Index
---@return MQBoolean
function fellowship.Sharing(index) end
