---@meta

---@class achievement
---@field Completed MQBoolean # If the achievement has been completed
---@field Description MQString # The achievement's description
---@field Hidden MQBoolean # If the achievement is hidden
---@field IconID MQInt # ID of the Achievement state.  See [Achievement Icon](https://docs.macroquest.org/reference/data-types/datatype-achievement/#achievement-icon) for more information.
---@field ID MQInt # The achivement's unique ID
---@field Index MQInt # The index of the achivement. See [Achievement Indices](https://docs.macroquest.org/reference/top-level-objects/tlo-achievement/#note-about-achievement-indices) for more information.
---@field Locked MQBoolean # If the achievement is locked
---@field Name MQString # The achievement's name
---@field ObjectiveCount MQInt # The number of objectives in this achievement
---@field Open MQBoolean # If the achievement is open
---@field Points MQInt # The point value for the achievement
---@field State MQString # The achievement state.  See [Achievement State](https://docs.macroquest.org/reference/data-types/datatype-achievement/#achievement-state) for more information.
local achievement = {}

---@diagnostic disable: duplicate-set-field
---Find an objective by it's Description
---@param description string
---@return achievementobj
function achievement.Objective(description) end

---Find an objective by it's Id
---@param id integer|string
---@return achievementobj
function achievement.Objective(id) end
---@diagnostic enable: duplicate-set-field

---Find an objective by it's Index in the Achievement
---@param id integer|string
---@return achievementobj
function achievement.ObjectiveByIndex(id) end


---Generate an cheivement link.  An optional name can be
---provided to display in the achievement, otherwise the
---current character's name will be used.
---@param name? string
---@return string
function achievement.Link(name) end

---@return time # Calendar time when the achievement was completed.
function achievement.CompletedTime() end
