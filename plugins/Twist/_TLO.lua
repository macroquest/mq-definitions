---@meta

--- Twist Lua Bindings
---@class mq.TLO.Twist
---@field Twisting fun(): boolean Returns TRUE if currently twisting, FALSE if not and NULL if plugin not loaded.
---@field Current fun(): integer Returns the current gem being sung, -1 for item or 0 if not twisting
---@field Next fun(): integer Returns the next gem to be sung, -1 for item or 0 if not twisting
---@field List fun(): string Returns the twist sequence in a format suitable for /twist.
mq.TLO.Twist = {}
