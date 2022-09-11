---@meta
---@class achievement
---@field ID fun():integer The achivement's unique ID
---@field Name fun():string The achievement's name
---@field Description fun():string The achievement's description
---@field Points fun():integer The point value for the achievement
---@field ObjectiveCount fun():integer The number of objectives in this achievement
---@field Index fun():integer The index of the achivement. See [Achivement Indices](https://docs.macroquest.org/reference/top-level-objects/tlo-achievement/#note-about-achievement-indices) for more information.
---@field IconID fun():integer ID of the Achievement state.  See [Achivement Icon](https://docs.macroquest.org/reference/data-types/datatype-achievement/#achievement-icon) for more information.
---@field State fun():string The achievement state.  See [Achievement State](https://docs.macroquest.org/reference/data-types/datatype-achievement/#achievement-state) for more information.
---@field Completed fun():boolean # If the achievement has been completed
---@field Open fun():boolean # If the achievement is open
---@field Locked fun():boolean # If the achievement is locked
---@field Hidden fun():boolean # If the achievement is hidden
---@field CompletedTime fun():time Calendar time when the achievement was completed.
achievement = {}

---Find an objective by it's Description
---@param description string
---@return achievementobj
function achievement.Objective(description) end

---Find an objective by it's Id
---@param id integer
---@return achievementobj
function achievement.Objective(id) end

---Generate an cheivement link.  An optional name can be
---provided to display in the achievement, otherwise the
---current character's name will be used.
---@param name? string
---@return string
function achievement.Link(name) end