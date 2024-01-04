---@meta

--- Navigation Lua Bindings
--- @class TLO.Navigation
--- @field public Active MQBoolean #Returns true if navigation is currently active
--- @field public Paused MQBoolean #Returns true if nativation is currently paused
--- @field public MeshLoaded MQBoolean #Returns true if a mesh is loaded for the zone
--- @field public Velocity MQInt #Returns your current velocity
TLO.Navigation = {}

----Returns true if a path exists for the target
---@param navigationParams string # Navigation parameters are the same parameters that would be passed to /nav
---@return boolean # Can navigate to the given [navigationParams]
function TLO.Navigation.PathExists(navigationParams) end

----Returns true if a path exists for the target
---@param target target 
---@return boolean # Can navigate to the given [target]
function TLO.Navigation.PathExists(target) end

----Returns the length of the path if one is found
---@param navigationParams string # Navigation parameters are the same parameters that would be passed to /nav
---@return integer # Length of the path if one is found given [navigationParams]
function TLO.Navigation.PathLength(navigationParams) end

----Returns the length of the path if one is found
---@param target target 
---@return integer # Length of the path if one is found given [target]
function TLO.Navigation.PathLength(target) end