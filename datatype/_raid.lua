---@diagnostic disable: duplicate-set-field

---@meta
---@class raid
---@field public AverageLevel MQInt #Average level of raid members (more accurate than in the window)
---@field public Invited MQBoolean #Have I been invited to the raid?
---@field public Leader MQRaidMember # Raid leader
---@field public Locked MQBoolean #Returns TRUE if the raid is locked
---@field public Looter MQInt #Number of specified looters
---Loot type: 
--- - 1 Leader
--- - 2 Leader & GroupLeader
--- - 3 Leader & Specified
---@field public LootType MQInt
---@field public MainAssist MQRaidMember # Raid main assist
---@field public MasterLooter MQRaidMember # Raid Master Looter
---@field public Members MQInt #Total number of raid members
---@field public Target MQRaidMember # Raid target (clicked in raid window)
---@field public TotalLevels MQInt #Sum of all raid members' levels
---@field public ToString MQString #None
local raid = {}

---Raid member by name
---@param name string
---@return raidmember
function raid.Member(name) end

---Raid member by index
---@param index integer
---@return raidmember
function raid.Member(index) end

---Specified looter by name
---@param name string
---@return string
function raid.Looter(name) end

---Specified looter by index
---@param index integer
---@return string
function raid.Looter(index) end
