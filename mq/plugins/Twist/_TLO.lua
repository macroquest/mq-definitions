---@meta

--- Twist Lua Bindings
---@class TLO.Twist
---@field Twisting MQBoolean #Returns TRUE if currently twisting, FALSE if not and NULL if plugin not loaded.
---@field Current MQInt #Returns the current gem being sung, -1 for item or 0 if not twisting
---@field Next MQInt #Returns the next gem to be sung, -1 for item or 0 if not twisting
---@field List MQString #Returns the twist sequence in a format suitable for /twist.
TLO.Twist = {}
