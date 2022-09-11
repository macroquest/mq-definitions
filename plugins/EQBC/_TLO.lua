---@meta

--- EQBC Lua Bindings
---@class TLO.EQBC
---@field Connected fun(): boolean Client connection status
---@field Names fun(): string List of connected characters (space delmited)
---@field Port fun(): string OFFLINE if not connected, port if connected
---@field Server fun(): string Hostname or IP of server you connected to
---@field ToonName fun(): string Character name as seen by EQBC \(may reflect YouPlayer\)
---@field Setting fun(): boolean Option enabled/disabled status. \(see **/bccmd set** for complete list\)
mq.TLO.EQBC = {}
